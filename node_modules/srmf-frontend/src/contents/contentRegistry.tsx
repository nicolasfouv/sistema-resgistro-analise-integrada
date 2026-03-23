import { type ContentProps } from "../components/content";

export interface PageConfig {
    title: string;
    adminOnly?: boolean;
    contents: ContentConfig[];
}

export interface ContentConfig {
    id: string; // formId
    label: string;
    loader?: () => Promise<any>;
    component: ContentProps<any>;
}

// Registry storage
const registry: Record<string, Record<string, PageConfig>> = {};

export function registerContent(
    categoryId: string,
    subCategoryId: string,
    pageTitle: string,
    content: ContentConfig,
    adminOnly?: boolean
) {
    if (!registry[categoryId]) {
        registry[categoryId] = {};
    }
    if (!registry[categoryId][subCategoryId]) {
        registry[categoryId][subCategoryId] = {
            title: pageTitle,
            adminOnly: adminOnly,
            contents: []
        };
    }

    const existingIndex = registry[categoryId][subCategoryId].contents.findIndex(c => c.id === content.id);
    if (existingIndex >= 0) {
        registry[categoryId][subCategoryId].contents[existingIndex] = content;
    } else {
        registry[categoryId][subCategoryId].contents.push(content);
    }
}

export function getPageConfig(categoryId: string, subCategoryId: string): PageConfig | null {
    return registry[categoryId]?.[subCategoryId] || null;
}

import { fetchUsersData, UsersPermissionsContent } from "./admin/users";
import { ApplicantPermissionsContent, fetchApplicantsData } from "./admin/applicants";
import { fetchVeterinarianVisitData, VeterinarianVisitContent } from "./liveanimals/veterinarianVisit/index";
import { fetchVeterinarianSampleData, VeterinarianSampleContent } from "./liveanimals/veterinarianSample/index";

export function initRegistry() {
    registerContent('admin', 'permissoes', 'Permissões', {
        id: UsersPermissionsContent.id,
        label: UsersPermissionsContent.label,
        loader: fetchUsersData,
        component: UsersPermissionsContent
    }, true);

    registerContent('admin', 'permissoes', 'Permissões', {
        id: ApplicantPermissionsContent.id,
        label: ApplicantPermissionsContent.label,
        loader: fetchApplicantsData,
        component: ApplicantPermissionsContent
    }, true);

    registerContent('animaisvivos', 'veterinario', 'Veterinário', {
        id: VeterinarianVisitContent.id,
        label: VeterinarianVisitContent.label,
        loader: fetchVeterinarianVisitData,
        component: VeterinarianVisitContent
    });

    registerContent('animaisvivos', 'veterinario', 'Amostra', {
        id: VeterinarianSampleContent.id,
        label: VeterinarianSampleContent.label,
        loader: fetchVeterinarianSampleData,
        component: VeterinarianSampleContent
    });
}

