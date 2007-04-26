Received: from devserv.devel.redhat.com (devserv.devel.redhat.com
	[172.16.58.1])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l3QC1nAn000788
	for <linux-lvm@redhat.com>; Thu, 26 Apr 2007 08:01:49 -0400
Received: from mx.meyering.net (sebastian-int.corp.redhat.com [172.16.52.221])
	by devserv.devel.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l3QC1nL6016817
	for <linux-lvm@redhat.com>; Thu, 26 Apr 2007 08:01:49 -0400
From: Jim Meyering <jim@meyering.net>
Date: Thu, 26 Apr 2007 14:01:48 +0200
Message-ID: <87slan4a4z.fsf@rho.meyering.net>
MIME-Version: 1.0
Subject: [linux-lvm] unchecked malloc return value in clvmd.c
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

The use of malloc in clvmd.c's send_local_reply
function lacks a check to detect a NULL return value:

    /* Send an aggregated reply back to the client */
    static void send_local_reply(struct local_client *client, int status, int fd)
    {
            ...
            replybuf = malloc(message_len);

            clientreply = (struct clvm_header *) replybuf;
            clientreply->status = status;
            ...

It should log the failure, at least, rather than dereferencing NULL.
Is it important to get each message out?  If so, it could fall back
on (or even use first) a static buffer that's large enough so that
most messages fit.  But if the message is too long, it can still fail,
of course.

Unfortunately, there's no simple way to tell callers about this.
At first, I was going to suggest changing the return type, and
then adjusting the callers, where possible.  But then I saw that
at least one caller (add_reply_to_list) is also a void function
(called from yet another void function), so even that starts to
look rather invasive.
