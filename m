Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBEEku128115
	for <linux-lvm@redhat.com>; Wed, 14 Dec 2005 09:46:56 -0500
Received: from pat.uio.no (IDENT:7411@pat.uio.no [129.240.130.16])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jBEEknmX015338
	for <linux-lvm@redhat.com>; Wed, 14 Dec 2005 09:46:49 -0500
Received: from mail-mx4.uio.no ([129.240.10.45])
	by pat.uio.no with esmtp (Exim 4.43) id 1EmXu1-000521-Qx
	for linux-lvm@redhat.com; Wed, 14 Dec 2005 15:46:45 +0100
Received: from surveyor.uio.no ([129.240.197.20])
	by mail-mx4.uio.no with esmtp (Exim 4.43) id 1EmXtz-0002t9-1w
	for linux-lvm@redhat.com; Wed, 14 Dec 2005 15:46:43 +0100
Received: from trondham by surveyor.uio.no with local (Exim 4.44)
	id 1EmXty-0000S6-Hr
	for linux-lvm@redhat.com; Wed, 14 Dec 2005 15:46:42 +0100
Subject: Re: [linux-lvm] Meta-flag: don't activate on boot
References: <15tbqzlmegk.fsf@surveyor.uio.no>
	<20051213130419.GH25866@agk.surrey.redhat.com>
From: Trond Hasle Amundsen <t.h.amundsen@usit.uio.no>
Date: Wed, 14 Dec 2005 15:46:42 +0100
In-Reply-To: <20051213130419.GH25866@agk.surrey.redhat.com> (Alasdair G.
	Kergon's message of "Tue, 13 Dec 2005 13:04:19 +0000")
Message-ID: <15toe3jka7h.fsf@surveyor.uio.no>
MIME-Version: 1.0
Sender: Trond Hasle Amundsen <t.h.amundsen@usit.uio.no>
Reply-To: linux-lvm@redhat.com
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Alasdair G Kergon <agk@redhat.com> writes:

> On Tue, Dec 13, 2005 at 12:19:39PM +0100, Trond Hasle Amundsen wrote:
>> It would be neat if there was a way to flag that a particular volume
>> group should not be activated by default, typically at boot time,
>> i.e. running 'vgchange -ay' shouldn't activate it. This is especially
>> useful in clustering environments, when you want to "share" a volume
>> group across several nodes for redundancy, but only activate it on one
>> node at a time.
>  
> You can already do this using tagging.

Ah... guess my mind was stuck with LVM1 :)

> Documentation:
>   Man pages for lvm, lvm.conf, vgchange, lvchange & lvcreate.
>
>   http://people.redhat.com/agk/talks/LVM2-LinuxTag2005/
>     Tagging, Slide 30 onwards
>
>   http://sources.redhat.com/cgi-bin/cvsweb.cgi/~checkout~/LVM2/doc/tagging.txt?rev=1.1&content-type=text/plain&cvsroot=lvm2
>     original specification

Thanks for the pointers, that really helped. But I can't get this to
work. I create a section 'tags' in lvm.conf which defines what I want
to use:

tags {
    hosttags = 1
    sg {
        host_list = [ "test-db1.uio.no" ]
    }
}

With this, the host test-db1 should get the tag '@sg', right?

I configure 'volume_list' in the activation section to define which I
want to activate on this host (I've tried without setting this, no
change):

    volume_list = [ "internvg", "internvg2", "@*" ]

I then add a tag '@sg' to the VG/LV in question:

    lvchange --addtag @sg cf-test1-vg/data
    vgchange --addtag @sg cf-test1-vg

I've verified that the tags are set with '{vg,lv}s -o +tags', but
'{vg,lv}s @sg' doesn't yield any output.

I then try to activate the VG/LV:

    vgchange -ay cf-test1-vg
    lvchange -ay cf-test1-vg/data

But it doesn't work. As long as the 'tags' section exists in the
config file the LV 'cf-test1-vg/data' won't activate. I'm probably
doing something wrong here, but I can't figure out what..

The config will obviously be somewhat more complicated in production.

FWIW, the system is running RHEL4 with lvm2-2.01.14-2.0.RHEL4 and
kernel 2.6.9-11.ELsmp.

Another issue, possibly related: the 'lvm dumpconfig' command doesn't
show the 'tags' section at all.

Cheers,

-- 
Trond Hasle Amundsen <t.h.amundsen@usit.uio.no>
Center for Information Technology Services, University of Oslo
