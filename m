Message-Id: <4.2.2.20000209065832.00ab7560@pop-server.austin.rr.com>
Date: Wed, 09 Feb 2000 07:00:12 -0600
From: Daniel Whicker <heimdall@mail.org>
Subject: Re: [linux-lvm] Re: Configuring boot partition with LVM (fwd)
In-Reply-To: <38A0C388.4DFF0811@msede.com>
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com


>At least the IBM people with the AIX LVM are able to make that work.
>The
>only thing that they were not able for a long time is to make system
>dumps work in such a configuration. But I believe that even that works
>under AIX 4.3.x now.

Actually, with AIX, they reserve at least one PP (PE) at the very beigining 
of each disk, which gives you at least a 4 meg contiguous area in which to 
put the kernel.  The bosboot copies the kernel into this area.  Really not 
to different that creating a /boot or a /stand.
									-Daniel
		------------------------------------------
		Daniel Whicker  (heimdall@mail.org)
