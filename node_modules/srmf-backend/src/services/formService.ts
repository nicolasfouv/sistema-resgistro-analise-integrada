import { prisma } from "..";


class FormService {

    async getNavigationOptions() {
        const options = await prisma.category.findMany({
            select: {
                id: true,
                name: true,
                categoryIcon: true,
                subCategory: {
                    select: {
                        id: true,
                        name: true,
                    }
                }
            }
        });
        return options;
    }

    async getForms() {
        const categories = await prisma.category.findMany({
            select: {
                name: true,
                subCategory: {
                    select: {
                        form: {
                            select: {
                                id: true,
                                name: true,
                            }
                        }
                    }
                }
            },
        });

        return categories.map((category) => {
            return {
                category: category.name,
                forms: category.subCategory.map((subCategory) => subCategory.form).flat(),
            };
        });
    }

    async getAccessLevel() {
        const levels = await prisma.enumAccessLevel.findMany();
        return levels;
    }
}

export { FormService };