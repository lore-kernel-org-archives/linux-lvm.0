Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k33FKQJQ022459
	for <linux-lvm@redhat.com>; Mon, 3 Apr 2006 11:20:26 -0400
Subject: Re: [linux-lvm] dmsetup works, but LVM2 fails
References: <m2psk0i1vs.fsf@janus.isnogud.escape.de>
	<20060403135204.GB4197@agk.surrey.redhat.com>
From: Urs Thuermann <urs@isnogud.escape.de>
Date: 03 Apr 2006 17:15:56 +0200
In-Reply-To: <20060403135204.GB4197@agk.surrey.redhat.com>;
	from Alasdair G Kergon on Mon, 3 Apr 2006 14:52:04 +0100
Message-ID: <m2irpq4rmb.fsf@janus.isnogud.escape.de>
MIME-Version: 1.0
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
To: linux-lvm@sistina.com

Alasdair G Kergon <agk@redhat.com> writes:

> Some of the patches that the latest lvm2 tools now rely upon have
> not been backported to 2.4 kernels, and we didn't put workarounds
> into libdevmapper.

OK, thanks.  What patches are these?  Critical bug fixes?  New
features?

> For now, you're limited to using older versions of the the tools 
> (device-mapper 1.01 and lvm2 2.01).

Do you mean by "For now" that this will change?  On the
not-so-long-term I will hopefully find the time change to 2.6 anyway,
also because of dm-crypt.  But for a couple of weeks or months I'll
stick to 2.4.

urs
