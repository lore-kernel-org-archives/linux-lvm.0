Message-ID: <4CBF5A3A.3050106@cfl.rr.com>
Date: Wed, 20 Oct 2010 17:08:10 -0400
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
References: <4CBF4B79.9080008@cfl.rr.com> <20101020205530.GC31510@redhat.com>
In-Reply-To: <20101020205530.GC31510@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Snapshot merge in the background?
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
Cc: Mike Snitzer <snitzer@redhat.com>

On 10/20/2010 4:55 PM, Mike Snitzer wrote:
> "Before finishing the boot"... can you be more specific?  Where was it
> stopped waiting for a snapshot merge?  How did you know it was waiting
> for snapshot merge?  Which distro are you using?

It seemed to be stopped waiting for the initial activation of the root
lv before continuing with the boot.  This manifested as a several minute
delay before the gui came up, and when I checked the bootchart image, it
was indeed sitting running lvm for a long time before everything else.
This is with Ubuntu 10.10.
