From: "Bill Rugolsky Jr." <brugolsky@telemetry-investments.com>
Subject: Re: [linux-lvm] fedora core 1 and LVM2
Message-ID: <20031202142250.GA21584@ti19.telemetry-investments.com>
References: <Pine.LNX.4.44.0312011923470.2017-100000@localhost.localdomain>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0312011923470.2017-100000@localhost.localdomain>
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
Date: Tue Dec  2 08:24:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: "Robert P. J. Day" <rpjday@mindspring.com>

On Mon, Dec 01, 2003 at 07:31:10PM -0500, Robert P. J. Day wrote:
>   this week sometime, i'm interested in configuring a system with the
> following properties:
> 
>   1) fresh install of fedora core 1 (FC1), with LVM1
>   2) upgrade to 2.6 (test) kernel
>   3) upgrade to LVM2
 
You've got (2) and (3) backwards.  The 2.6 kernel doesn't have
LVM1, so you won't be able to boot your system.  You need to install
the 2.4 kernel, get DM+LVM2 working, and then move up to 2.6.

Regards,

	Bill Rugolsky
