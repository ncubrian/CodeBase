import jenkins.model.Jenkins
import hudson.model.Job
import jenkins.model.BuildDiscarderProperty
import hudson.tasks.LogRotator
// 遍历Foobar 视图中的所有的任务
Jenkins.instance.getView("Foobar").getAllItems().each{ job ->
	if ( job.isBuildable() && job.supportsLogRotator()) {
	    println " \"${job.fullDisplayName}\" 处理中"
	    job.addProperty(new BuildDiscarderProperty(new LogRotator (-1, -1, -1, 5)))
	    println "$job.name 已更新"
	}
}
return;


import jenkins.model.Jenkins
import hudson.model.Job
import jenkins.model.BuildDiscarderProperty
import hudson.tasks.LogRotator
// 遍历所有的任务
Jenkins.instance.allItems(Job).each { job ->
    if ( job.isBuildable() && job.supportsLogRotator() ) {
        println " \"${job.fullDisplayName}\" 处理中"
        job.addProperty(new BuildDiscarderProperty(new LogRotator (-1, -1, -1, 3)))
        println "$job.name 已更新"
    }
}
return;
