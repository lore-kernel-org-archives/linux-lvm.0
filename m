From: "Steffen Koch" <Steffen.Koch@koch-enterprises.de>
In-Reply-To: <20030419192108.A18402@ultraviolet.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] pvcreate problem on new IDE disk
Message-Id: <E197Ybh-00065W-00@mrelayng.kundenserver.de>
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
Date: Mon Apr 21 05:33:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "linux-lvm@sistina.com" <linux-lvm@sistina.com>

On Sat, 19 Apr 2003 19:21:08 -0700, Tracy R Reed wrote:

>But when I do the pvcreate I get this error:
>
>home:~# pvcreate /dev/hdd2
>  Failed to read existing physical volume '/dev/hdd2'
>  /dev/hdd2: Couldn't find device.
>  Failed to setup physical volume "/dev/hdd2"

did you reboot after fdisk??
