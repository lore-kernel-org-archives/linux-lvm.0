From: Marco De Benedetto <debe@galliera.it>
Subject: Re: [linux-lvm] Boot/rescue disks with LVM support
Message-ID: <20031128182004.GA32398@galliera.it>
References: <20031128172933.GD15025@riseup.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20031128172933.GD15025@riseup.net>
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Fri Nov 28 12:21:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On ven 28 nov, Micah Anderson wrote:
> Does anyone know what rescue/boot disks that are out there that have
> LVM built in? I want to be prepared in the event of a failure, and
> usually have a handy toms rootboot or similar near the machine, but
> does it have LVM support, I could not find it if so.
I use:
1) a Timo rescue CD (http://rescuecd.sourceforge.net/), modified with
   all the packages I need,
2) or I create a CD with bootcdwrite from the package (Debian) bootcd:
   it creates a live CD of your system; it is great.

--
debe
