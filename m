Date: Fri, 14 Dec 2012 15:10:49 -0500
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20121214201049.GA3859@redhat.com>
References: <50C9F2D6.7090802@ubuntu.com> <20121214192953.GB3148@redhat.com>
	<50CB8477.30708@ubuntu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <50CB8477.30708@ubuntu.com>
Subject: Re: [linux-lvm] Non 512 byte sectors
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
Content-Transfer-Encoding: 7bit
To: Phillip Susi <psusi@ubuntu.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Dec 14 2012 at  2:56pm -0500,
Phillip Susi <psusi@ubuntu.com> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 12/14/2012 2:29 PM, Mike Snitzer wrote:
> > On Thu, Dec 13 2012 at 10:23am -0500, Phillip Susi
> > <psusi@ubuntu.com> wrote:
> > 
> >> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
> >> 
> >> Is it possible to get dm to report > 512 byte sector size?  If
> >> so, how?
> > 
> > DM will automatically stack the physical and logical sector sizes
> > based on the devices that are assembled into the DM device.
> 
> Yes, but what if I am using two physical disks with 512 byte sectors,
> but want the dm to appear to have 2048 byte sectors?

DM has no role in fabricating devices with artificial limits.
What do you hope to accomplish with this?
