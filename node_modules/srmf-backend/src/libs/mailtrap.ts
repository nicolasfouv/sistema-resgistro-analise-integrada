import { MailtrapClient } from "mailtrap";
import nodemailer from 'nodemailer';


export async function sendEmail(to: string, subject: string, body: string) {
    const apiKey = process.env.MAILTRAP_API_KEY as string;
    const isSandbox = process.env.MAILTRAP_USE_SANDBOX === "true";
    const inboxId = Number(process.env.MAILTRAP_INBOX_ID);

    const options = isSandbox ? {token: apiKey, sendbox: isSandbox, testInboxId: inboxId} : {token: apiKey}

    const mailtrap = new MailtrapClient(options);

    const transport = nodemailer.createTransport({
        host: "sandbox.smtp.mailtrap.io",
        port: 2525,
        auth: {
            user: "14ce6c4da4be41",
            pass: "f69b1664815cb3"
        }
    });

    const info = await transport.sendMail({
        from: 'no-reply@demomailtrap.co',
        to: to,
        subject: subject,
        text: body, // Plain-text version of the message
        // html: "<b>Hello world?</b>", // HTML version of the message
    });

    try {
        await mailtrap.send({
            from: {
                name: '14ce6c4da4be41', 
                email: 'sandbox.smtp.mailtrap.io',
            },
            to: [{email: to}],
            subject: subject,
            text: body,
            // html: body,
        });
        return true;
    } catch (error) {
        return false;
    }
}