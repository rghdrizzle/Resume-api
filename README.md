# Resume-api
A Resume API with Azure functions which displays your resume information in JSON

[![CircleCI](https://circleci.com/gh/rghdrizzle/Resume-api.svg?style=shield)](https://app.circleci.com/pipelines/github/rghdrizzle/Resume-api)
<h2>REQUIREMENTS</h2>
<ul>
<li>Python 3.7 or later</li>
<li> Azure SDK for python</li>
<li>Azure blob storage and a fucntion app</li>
<li>Terraform cli</li>
</ul>
<h2>INSTALLATION</h2>
<ul>
<li>Clone or download the repository</li>
<li>Install the required packages by running `pip install -r requirements.txt`</li>
<li>Replace the enviornment variables with the required keys or strings or give those env variables values either in the Azure functions explorer or elsewhere</li>
<li>Go to the infra folder and apply the code by typing `terraform apply` to provision necessary resources in Azure</li>
</ul>

<h2>USAGE</h2>
<ul>
<li>Trigger the pipeline to deploy the code or deploy it using the <a href="https://learn.microsoft.com/en-us/azure/azure-functions/create-first-function-vs-code-python?pivots=python-mode-configuration">vscode extension</a></li>
<li>The script will automatically fetch the JSON file from the specified blob storage and display the resume</li>
</ul>

<h2>STAGES</h2>
<ul>
<li>Writing the Function in Python</li>
<li>Provisioning the infrastructure using Terraform</li>
<li>Deploying the function using a CICD pipeline to Azure Functions</li>
</ul>
<h2>TOOLS USED</H2>
<ul>
<li>Python</li>
<li>Azure functions core tool and Azure blob</li>
<li>Terraform</li>
<li>CircleCI</li>
</ul>

<h2>Workflow</h2>
<img src="https://github.com/rghdrizzle/Resume-api/blob/main/resumeworkflow(1).png">

<h2> WRITING THE FUNCTION </h2>
<ul>
<li> The Function is written in Python using the Azure SDK for python . The function basically connects to the azure storage account through connection string and key and downloads the file required from the blob storage and displays it </li>
<li> The strings such as the connection string and the key can be stored as Enviornment variable or you can <a href="https://learn.microsoft.com/en-us/azure/azure-functions/functions-how-to-use-azure-function-app-settings?tabs=portal">configure them in the functions.json file</a></li> 
<li> The json file is uploaded to the blob storage after the provisioning of the resources takes place</li>
</ul>
<h2>Terraform</h2>
<ul>
<li>Using Terraform to provision the resources needed for this project. Since the provisioning of the resources happens in the pipeline , the state files are stored in a backend , in my case it is Terraform cloud</li>
<li>So using the code I created a resource group , storage account , container , service plan and a function app thorugh Terraform . You can create your own IaC with ur desired tool such a pulumi or biceps</li>
</ul>
<h2>CICD</h2>
<ul>
<li>For the CICD , I used circleCI . The workflow is to automate the process of provisioning the infrastructure whenever the pipeline is triggered through tags. There is another Job to automate the deployment of the application to the Azure functionapp whenever the pipeline is triggered</li>
</ul>

<p> This was a great learning project for me, I learnt more about functions and serverless in general and I did come across a lot of minor issues when working on this project and solving them did help me a lot in understanding the workings and where I stand in the topic . In the end it was Fun :). You can try to do this project too with your own choosing of languages or tools . Im planning to build more on this in the future.</p> 
