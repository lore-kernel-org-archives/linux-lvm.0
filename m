Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r2LIN9I0004765
	for <linux-lvm@redhat.com>; Thu, 21 Mar 2013 14:23:09 -0400
Received: from h01.hoster-ok.com (h01.hoster-ok.com [88.86.111.110])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2LIN6nN008790
	for <linux-lvm@redhat.com>; Thu, 21 Mar 2013 14:23:07 -0400
Received: from [192.168.1.100] (mm-159-187-121-178.dynamic.pppoe.mgts.by
	[178.121.187.159] (may be forged)) (authenticated as <bubble>)
	by h01.hoster-ok.com (8.14.3/8.14.3/HOSTER-OK) with ESMTP id
	r2LIN3ok014690
	(using TLSv1/SSLv3 with cipher DHE-RSA-AES256-SHA (256 bits) verified
	NO) for <linux-lvm@redhat.com>; Thu, 21 Mar 2013 19:23:04 +0100
Message-ID: <514B5006.7080306@hoster-ok.com>
Date: Thu, 21 Mar 2013 21:23:02 +0300
From: Vladislav Bogdanov <bubble@hoster-ok.com>
MIME-Version: 1.0
References: <1363699970-10002-1-git-send-email-bubble@hoster-ok.com>
	<1363699970-10002-11-git-send-email-bubble@hoster-ok.com>
	<20130319153215.GB986@redhat.com>
In-Reply-To: <20130319153215.GB986@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [PATCH 10/10] man: document --node option to
	lvchange
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

19.03.2013 18:32, David Teigland wrote:
> On Tue, Mar 19, 2013 at 01:32:50PM +0000, Vladislav Bogdanov wrote:
>> +.B \-\-node \fINodeID
>> +Perform specified activation command on a remote cluster node (the same to running
>> +corresponding command on that node locally).
>> +Currently tested only for corosync clusters (\fB-I\fP \fIcorosync\fP option to clvmd)
>> +for corosync versions from 2.0.
>> +If corosync configuration has node names in a nodelist (nodelist.node.X.name = name
>> +in CMAP tems) or node names are used for ring0_addr (nodelist.node.X.ring0_addr = name),
>> +then that names may be used as NodeID. Otherwise numeric node IDs should be used.
> 
> lvm tools should move away from doing remote command execution.

This would break current behavior btw (I do not say current is the right
one, but it exists).
lvchange -ay|-an on a clustered LV activates it shared everywhere in
cluster. Internally this is done by sending message to all nodes
(wildcard). Each node obtain shared lock itself then.

I just slightly modified this to be able to send targeted messages.
Everything was already in code, I just made it work for non-wildcard
messages and added possibility to enable this in tools.

> As you mentioned before, this is the equivalent of "ssh node lvchange".
> ssh or some other tool outside lvm is the right way to run the remote
> commands.
> 
> Also, lvm should not assume that it's using dlm/corosync, or that this
> kind of remote option will be possible to support.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
