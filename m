Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1OHFBi20472
	for <linux-lvm@redhat.com>; Tue, 24 Feb 2004 12:15:11 -0500
Received: from behemoth.sci.local (e3hst100.csg.stercomm.com [204.214.3.100])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1OHFAb22403
	for <linux-lvm@redhat.com>; Tue, 24 Feb 2004 12:15:11 -0500
Received: from stercomm.com (localhost [127.0.0.1])
	by behemoth.sci.local (Postfix) with ESMTP id 4F789B4B
	for <linux-lvm@redhat.com>; Tue, 24 Feb 2004 11:15:05 -0600 (CST)
Message-ID: <403B8699.2030301@stercomm.com>
From: Chris Cox <chris_cox@stercomm.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM + reiserfsck
References: <20040224020859.43153.qmail@web41503.mail.yahoo.com>
In-Reply-To: <20040224020859.43153.qmail@web41503.mail.yahoo.com>
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Tue Feb 24 12:14:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Rajesh Saxena wrote:
> Hello list I am wondering if someone could help me with a quick 
> question. I am using SUSE 9 + LVM1 + Linux Software RAID and last but
> not least Reiser filesystem. Recently I had problem with recovery from
> LVM volumes where /usr/lib is deleted =(
> 

Not sure.. but if your system is unstable (hard crashes), for whatever
reason, SUSE 9 now has a VERY bad habit of eliminating directories
that are merely open for READING... ick!!!  I've lost several.
My solution, stablize the system.  There's something not quite right
either with the latest reiserfs patches, the SUSE 9 kernel or the combination
of LVM/Reiserfs/kernel in SUSE 9.  Btw... this problem DOES NOT exist at
all in SUSE 8.2.... you crash that baby as much as you want (practically) and
I've always been able to get back the important data.

My guess is that there is a "fix" for reiserfs that shouldn't be there.

With that said... I've seen much the same under ext2/ext3... but
it's always been that way with those filesystems.  I still like
reiserfs overall.  Under SUSE it has a good track record... just
something not right with SUSE 9.
