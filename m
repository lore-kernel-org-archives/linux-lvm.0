Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mA48lrMm025716
	for <linux-lvm@redhat.com>; Tue, 4 Nov 2008 03:47:54 -0500
Received: from om.cz.net (om.cz.net [193.85.2.13])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mA48lKiM016350
	for <linux-lvm@redhat.com>; Tue, 4 Nov 2008 03:47:21 -0500
Received: from 192.168.60.224 ([193.179.76.212])
	by om.cz.net (8.13.8/8.13.8/om) with SMTP id mA48lJvX086981
	for <linux-lvm@redhat.com>; Tue, 4 Nov 2008 09:47:19 +0100 (CET)
Received: from [192.168.58.13] (skadlec.es.gk-software.com [192.168.58.13])
	by hermes.es.gk-software.com (Postfix) with ESMTP id CFC7C8F755
	for <linux-lvm@redhat.com>; Tue,  4 Nov 2008 09:47:19 +0100 (CET)
Message-ID: <49100C23.6070701@gk-software.com>
Date: Tue, 04 Nov 2008 09:47:31 +0100
From: Stepan Kadlec <skadlec@gk-software.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] clvmd locking disabled
References: <490678BE.1070700@hidden.domain.name>	<08781647-26E4-46F3-B148-A64933B84363@redhat.com>	<4907AF21.4030808@hidden.domain.name>	<49083B9E.4090308@gk-software.com>	<49083EBC.5080301@gk-software.com>	<490849C2.2040900@redhat.com>	<490AF885.3060504@gk-software.com>
	<490AFD59.8070809@redhat.com>
In-Reply-To: <490AFD59.8070809@redhat.com>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>



Milan Broz wrote:
> Stepan Kadlec wrote:
>> ok, I have recompiled it with --with-cluster=internal, but still seeing:
>>
>> WARNING: Locking disabled. Be careful! This could corrupt your metadata.
> 
> Is it during clvmd initialization only?
> 
> clvmd tries to initialize locks for possible already activated volumes
> (mostly safety/force restart check, clvmd must start before clustered LVs
> are activated anyway)
> 
> It simply run lvs command (forcing nolocking for this command)
> to check which volumes are activated.
> The log message is misleading here...
> 
> After clvmd initialization, it should work as expected.
> 

I have looked into the sources:

1) the clvmd starts the thread lvm_thread_fn() from clvmd.c
2) it calls the init_lvm() function from lvm-functions.c
3) it calls the get_initial_state() function from lvm-functions.c
4) in get_initial_state is following call:

FILE *lvs = popen
             ("lvm lvs  --config 'log{command_names=0 prefix=\"\"}' 
--nolocking --noheadings -o vg_uuid,lv_uuid,lv_attr,vg_attr",
              "r");

-> it calls lvm command with the --nolocking option - this is passed to 
all following steps:

5) the lvm commands calls lvm_run_command() function from lvmcmdline.c
6) it calls init_locking() function from locking.c
7) init_locking() than print the "locking disabled" warning, because the 
--nolocking option

SO:
a) is it alright, that the "lvm lvs" command is internally called with 
--nolocking option?
b) does it mean, that locking works alright for the rest of clvmd 
operations but the get_initial_state() call? in this case the debug 
message is very confusing.

bye stepan

> Milan
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 

-- 
Eurosoftware s.r.o.
skadlec@gk-software.com
+420 379 307 379
+420 724 554 104
