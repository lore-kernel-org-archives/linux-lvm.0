Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m1TEekQT007799
	for <linux-lvm@redhat.com>; Fri, 29 Feb 2008 09:40:46 -0500
Received: from po-out-1718.google.com (po-out-1718.google.com [72.14.252.153])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m1TEe06q026434
	for <linux-lvm@redhat.com>; Fri, 29 Feb 2008 09:40:02 -0500
Received: by po-out-1718.google.com with SMTP id b23so6045008poe.1
	for <linux-lvm@redhat.com>; Fri, 29 Feb 2008 06:39:50 -0800 (PST)
Message-ID: <a71bd89a0802290639t34ee72e7q4379df51e392b900@mail.gmail.com>
Date: Fri, 29 Feb 2008 06:39:50 -0800
From: "Dan Kegel" <dank@kegel.com>
Sender: daniel.r.kegel@gmail.com
Subject: Re: [linux-lvm] Snapshot of a Snapshot
In-Reply-To: <A374F37068535C46BFCF8D48CF29AA7FA60045@zen.zetex.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <A374F37068535C46BFCF8D48CF29AA7FA60045@zen.zetex.com>
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

On Fri, Feb 29, 2008 at 3:27 AM, Karl Wagner <kwagner@zetex.com> wrote:
>  I was just wondering if there was a plan to add 'Snapshot of a Snapshot'
>  functionality to LVM2? If so, is there any timescale on it?
>
>  This would be a very useful feature, especially in a Xen environment.
>
>  Also, is there an easy way to backup and restore a snapshot? My scenario
>  is that I am running several Xen DomU's (Virtual machines, 4 of them to
>  be precise) from snapshots of a base image. However, if one dies (eg the
>  snapshot overflows, something which should not happen again but just in
>  case...) and I recreate the snapshot and restore the backup image I
>  took, it fills the snapshot up.

It sounds like you could use a 'revert to snapshot' feature.
Is that right?
- Dan
