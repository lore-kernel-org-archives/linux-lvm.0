Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o7JDr1bp018941
	for <linux-lvm@redhat.com>; Thu, 19 Aug 2010 09:53:01 -0400
Received: from web53402.mail.re2.yahoo.com (web53402.mail.re2.yahoo.com
	[206.190.37.49])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id o7JDqo8M030344
	for <linux-lvm@redhat.com>; Thu, 19 Aug 2010 09:52:50 -0400
Message-ID: <819282.26459.qm@web53402.mail.re2.yahoo.com>
Date: Thu, 19 Aug 2010 06:52:49 -0700 (PDT)
From: Tom Graves <tgraves_cs@yahoo.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-660359349-1282225969=:26459"
Subject: [linux-lvm] vgs adds to .cache but doesn't remove
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--0-660359349-1282225969=:26459
Content-Type: text/plain; charset=us-ascii

Sorry if everyone already got this. I don't see it in the archives and I just 
subscribed to the mailing list itself..





Hello all,

I am having an issue where it seems that the vgs  command is adding new LV's to 
the  /etc/lvm/cache/.cache but they never  get removed when the LV's are 
deleted.   


Basically this  eventually causes me to run out of space in /var/log because 
dmeventd is  reading the cache file and trying to stat all the removed LV's 
which  leads to the log files having a bunch of cannot stat lv because it was  
one that was removed.

Here is what I do:

-bash-3.2$  sudo lvcreate --name tom2323tt --size 20G sys
-bash-3.2$  sudo  /usr/sbin/vgs --separator : --noheadings --units b 
--unbuffered --nosuffix --options vg_size,vg_free sys
-bash-3.2$ sudo cat  /etc/lvm/cache/.cache  | grep tom
# This file is automatically  maintained by lvm.
                "/dev/mapper/sys-tom2323tt",
                "/dev/sys/tom2323tt",
-bash-3.2$ sudo lvremove /dev/sys/tom2323tt
-bash-3.2$  sudo  /usr/sbin/vgs --separator : --noheadings --units b 
--unbuffered --nosuffix --options vg_size,vg_free sys
  497717084160:436295696384
-bash-3.2$ sudo cat  /etc/lvm/cache/.cache  | grep tom
# This file is automatically maintained by lvm.
                "/dev/mapper/sys-tom2323tt",
                 "/dev/sys/tom2323tt",

This is running rhel5.4 with lvm2-2.02.46-8.el5.

I know that do get cleaned up by vgscan but we currently aren't  running it.

Does anyone know why they aren't deleted?   Am I missing something?

Thanks,
Tom
--0-660359349-1282225969=:26459
Content-Type: text/html; charset=us-ascii

<html><head><style type="text/css"><!-- DIV {margin:0px;} --></style></head><body><div style="font-family:times new roman,new york,times,serif;font-size:12pt"><div>Sorry if everyone already got this. I don't see it in the archives and I just subscribed to the mailing list itself..<br></div><div style="font-family: times new roman,new york,times,serif; font-size: 12pt;"><br><div style="font-family: times new roman,new york,times,serif; font-size: 12pt;"><br>
<div style="font-family: times new roman,new york,times,serif; font-size: 12pt; color: rgb(0, 0, 0);"><div>Hello all,<br><br>I am having an issue where it seems that the vgs 
command is adding new LV's to the&nbsp; /etc/lvm/cache/.cache but they never 
get removed when the LV's are deleted.&nbsp;&nbsp; <br><br>Basically this 
eventually causes me to run out of space in /var/log because dmeventd is
 reading the cache file and trying to stat all the removed LV's which 
leads to the log files having a bunch of cannot stat lv because it was 
one that was removed.<br><br>Here is what I do:<br><br>-bash-3.2$&nbsp; sudo lvcreate --name tom2323tt --size 20G sys<br>-bash-3.2$&nbsp; sudo&nbsp; /usr/sbin/vgs --separator : --noheadings --units b --unbuffered --nosuffix --options vg_size,vg_free sys<br>-bash-3.2$ sudo cat&nbsp; /etc/lvm/cache/.cache&nbsp; | grep tom<br># This file is automatically
 maintained by lvm.<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "/dev/mapper/sys-tom2323tt",<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "/dev/sys/tom2323tt",<br>-bash-3.2$ sudo lvremove /dev/sys/tom2323tt<br>-bash-3.2$&nbsp; sudo&nbsp; /usr/sbin/vgs --separator : --noheadings --units b --unbuffered --nosuffix --options vg_size,vg_free sys<br>&nbsp; <span class="yshortcuts" id="lw_1282225911_0">497717084160</span>:436295696384<br>-bash-3.2$ sudo cat&nbsp; /etc/lvm/cache/.cache&nbsp; | grep tom<br># This file is automatically maintained by lvm.<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "/dev/mapper/sys-tom2323tt",<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 "/dev/sys/tom2323tt",<br><br>This is running rhel5.4 with lvm2-<span class="yshortcuts" id="lw_1282225911_1">2.02.46</span>-8.el5.<br><br>I know that do get cleaned up by vgscan but we currently aren't
 running it.<br><br>Does anyone know why they aren't deleted?&nbsp;&nbsp; Am I missing something?<br><br>Thanks,<br>Tom</div>
</div></div></div>
</div></body></html>
--0-660359349-1282225969=:26459--
