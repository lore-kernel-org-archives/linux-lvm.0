Message-ID: <507FE818.3070009@redhat.com>
Date: Thu, 18 Oct 2012 13:29:28 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <CB12DB70-5C4F-4936-9EDE-BFF4096D064F@active.ee>
	<507FDA2E.8080301@redhat.com>
	<CC9722DE-C18E-4CC7-A442-9256CCD46E2A@active.ee>
In-Reply-To: <CC9722DE-C18E-4CC7-A442-9256CCD46E2A@active.ee>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] how to recover after thin pool metadata did fill up?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Andres Toomsalu <andres@active.ee>

Dne 18.10.2012 12:42, Andres Toomsalu napsal(a):
> Yes I know that its not currently possible to recover this pool anymore - and we got data copied from read-only mode anyway - but bigger problem is that there is even no known way to reset/recreate pool - as I cant delete/remove the pool - which means that only erasing all PV will help probably. Im just looking for a way to erase faulty pool (with erasing data) and to be able recreate it without full OS reinstall. Is there a way to do it - DM mapper low level commands perhaps?
>


This case is pretty simple this way:


vgcfgbackup -f  vg.bak   vgname

edit vg.bak and remove all thinp related volumes

vgcfgrestore -f vg.bak  vgname


The reason why current upstream code rather avoids modifying  metadata by 
tools is - to avoid making first worst for recover in the first place.

Please note we already have some work done towards removing mutliple LVs
more efficiently - https://bugzilla.redhat.com/show_bug.cgi?id=817768

Zdenek
