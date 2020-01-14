﻿$List=Get-DynamicDistributionGroup "Dynamic Distro Group"
get-recipient -OrganizationalUnit $List.RecipientContainer -RecipientPreviewFilter $List.RecipientFilter -result unlimited |ft Alias,DisplayName,Title,StateOrProvince,PrimarySmtpAddress