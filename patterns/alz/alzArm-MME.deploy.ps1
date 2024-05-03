

az login --tenant d3450f80-7150-46aa-bfab-194c2ff90391

#************************************************************#
# Subscription PROD

    az account set -s "711c2059-9e0b-404c-9653-5b31ad49a4fc"

    az account show
    Set-Location "C:\Users\ManuelMeyer\OneDrive - GrabX Solutions\_Projects\Profond SLA\_Code\amba_monitoring-profond\patterns\alz"
    $template = ".\alzArm-MME.json"

    #ugly hack warning here: I am referencing the template from the original repo fork here:
    $templateUri =  "https://raw.githubusercontent.com/grabx/amba_azure-monitor-baseline-alerts/main/patterns/alz/alzArm.json"
    $parameterfile = ".\alzArm-MME.param.json"
    
    #Validate File
    az deployment mg validate `
        --management-group-id "manutenant" `
        --template-uri  $templateUri `
        --parameters $parameterfile `
        --location "switzerlandnorth" 

    #Deploy Template
    $deploymentname = $template.Trim('.', '\').Replace('\','_') + "-" + (Get-Date -format yyyyMMddhhmm).ToString()
    az deployment mg create `
        --name $deploymentname `
        --management-group-id "manutenant" `
        --template-uri  $templateUri `
        --parameters $parameterfile `
        --location "switzerlandnorth" 






        
    #--template-file $template `
     #--template-uri  https://raw.githubusercontent.com/***YourGithubFork***/azure-monitor-baseline-alerts/***main


#     az deployment mg create --name "amba-GeneralDeployment" --template-uri  https://raw.githubusercontent.com/***YourGithubFork***/azure-monitor-baseline-alerts/***main
# or branchname***/patterns/alz/alzArm.json --location $location --management-group-id $pseudoRootManagementGroup --parameters ".\patterns\alz\alzArm.param.json"


    # az deployment group create `
    #     --name $deploymentname `
    #     --resource-group $resourcegroup `
    #     --template-file $template `
    #     --parameters $parameterfile 


    # az deployment mg create `
    #     --name "amba-mme-deployment" `
    #     --template-file ".\alsArm-MME.json"
    #     --location "switzerlandnorth" `
    #     --management-group-id "manutenant" `
    #     --parameters ".\patterns\alz\alzArm.param.json"