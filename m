Date: Wed, 26 Feb 2014 23:26:48 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20140226232648.GA6021@agk-dp.fab.redhat.com>
References: <530E1EA8.9020301@ubuntu.com> <530E30B4.6020505@redhat.com>
	<530E3464.3050606@ubuntu.com> <530E3CAA.1070308@redhat.com>
	<530E541C.9040001@ubuntu.com> <530E5F36.5070002@redhat.com>
	<530E67E9.9060005@ubuntu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <530E67E9.9060005@ubuntu.com>
Subject: Re: [linux-lvm] libdevmapper's handling of devices with spaces
	in	the name
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
Cc: LVM general discussion and development <linux-lvm@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>

On Wed, Feb 26, 2014 at 05:17:13PM -0500, Phillip Susi wrote:
> I'm also still wondering why udev can't simply handle quoted names
> with spaces in them.  People have been dealing with this sort of thing
> in shell for years...
 
Once you've had exposure to udev you soon learn that "wondering why" gets
you nowhere:)  However bizarre, your only option is to conform.
Name mangling in lvm2/device-mapper was designed both to conform and
to still allow for all possibilities in as transparent a way as we could.

The primary new limitation is a reduction in the effective maximum length
of a device name due to the quoting.  If this becomes a problem we will have
to extend the kernal API to support longer names.

Alasdair
