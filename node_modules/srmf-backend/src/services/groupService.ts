import { prisma } from "..";


export class GroupService {
    async getAllGroups() {
        const groupAccesses = await prisma.groupAccess.findMany({
            select: {
                group: {
                    select: {
                        id: true,
                        name: true,
                    }
                },
                form: {
                    select: {
                        id: true,
                    }
                },
                enumAccessLevel: {
                    select: {
                        id: true,
                    }
                }
            }
        });

        let groups: {
            id: string,
            name: string,
            groupAccess: {
                formId: string,
                accessLevelId: string | null
            }[]
        }[] = [];
        groupAccesses.forEach(access => {
            const groupId = access.group?.id;
            if (!groupId) return;

            const group = groups.find(g => g.id === access.group.id);
            if (group) {
                group.groupAccess.push({
                    formId: access.form.id,
                    accessLevelId: access.enumAccessLevel?.id ?? null
                });
            } else {
                groups.push({
                    id: access.group.id,
                    name: access.group.name,
                    groupAccess: [{
                        formId: access.form.id,
                        accessLevelId: access.enumAccessLevel?.id ?? null
                    }]
                });
            }
        });
        return groups;
    }
}