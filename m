Date: Tue, 14 Nov 2000 16:09:47 +0000 (GMT)
From: Paul Jakma <paulj@itg.ie>
Subject: Re: [linux-lvm] LVM in shared parallel SCSI environment
In-Reply-To: <20001114093855.A21984@kevorkian.evcom.net>
Message-ID: <Pine.LNX.4.30.0011141608080.21566-100000@rossi.itg.ie>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jesse Sipprell <jss@evcom.net>
Cc: Jos Visser <josv@osp.nl>, linux-lvm@msede.com

On Tue, 14 Nov 2000, Jesse Sipprell wrote:

> In the mean time, I'll just have to do things the old fashioned
> way.  I'll put a procedure in place that any LVM changes done from
> a particular node require the bouncing of VGs on all other
> attached nodes.  Fortunately, after initial cluster setup,
> manipulation of LVs won't really be performed on a routine basis.

and so what do you do with these LV's? The filesystem/application you
run on them has to be aware of the shared-access nature of the
device.. so that rules out all but GFS - which IIRC already has some
LVM like features.

--paulj
