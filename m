Date: Wed, 26 Aug 2015 09:17:35 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20150826141735.GA24955@redhat.com>
References: <55DC3EBF.4030703@shockmedia.nl> <55DD9C1C.9070105@redhat.com>
	<55DDAF71.5080307@shockmedia.nl> <55DDB49D.7060501@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <55DDB49D.7060501@redhat.com>
Subject: Re: [linux-lvm] Snapshots on clustered LVM
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
To: Bram Klein Gunnewiek <bram@shockmedia.nl>, Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Aug 26, 2015 at 02:44:13PM +0200, Zdenek Kabelac wrote:
> Also there are already existing solutions for what you describe, but
> I assume you prefer your own home-brewed solution - but it's long
> journey ahead of you...

RHEV/ovirt is an existing solution that uses lvm on multiple hosts and
does live migration.  They have quite a bit of very specialized lvm code
to do that right -- not typical lvm usage at all.
