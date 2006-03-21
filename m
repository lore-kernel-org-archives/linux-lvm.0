Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k2LKrMgS007851
	for <linux-lvm@redhat.com>; Tue, 21 Mar 2006 15:53:22 -0500
Received: from pproxy.gmail.com (pproxy.gmail.com [64.233.166.183])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k2LKrG7A026099
	for <linux-lvm@redhat.com>; Tue, 21 Mar 2006 15:53:17 -0500
Received: by pproxy.gmail.com with SMTP id 57so2090812pya
	for <linux-lvm@redhat.com>; Tue, 21 Mar 2006 12:53:16 -0800 (PST)
Message-ID: <87f94c370603211253l378cae32y1764a3d254afe742@mail.gmail.com>
Date: Tue, 21 Mar 2006 15:53:16 -0500
From: "Greg Freemyer" <greg.freemyer@gmail.com>
Subject: Re: [linux-lvm] Hardware snapshots and LVM2?
In-Reply-To: <H000007200c27f69.1142968273.fsu50.nll.se@MHS>
MIME-Version: 1.0
Content-Disposition: inline
References: <H000007200c27f69.1142968273.fsu50.nll.se@MHS>
Content-Transfer-Encoding: 8bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On 3/21/06, fredrik.backman@nll.se <fredrik.backman@nll.se> wrote:
> Hi
>
> Im doing a snapshot (hardware-based in EVA5000) of a LV
> (lvm2) and i
> wonder what is the correct way to use this snapshot?
> Problem is that
> this snapshot has the same ID as the original one. In HP-UX
> a would do a
> vgchgid on this snapshot-LV. Any help would be aprreciated.
>
> Regards Fredrik

I think that is filesystem dependent.

If you happen to be using XFS I believe they have a mount option like
"-o nouuid".

Do a man mount.xfs to double check.

Greg
--
Greg Freemyer
The Norcross Group
Forensics for the 21st Century
