From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] (no subject)
Message-ID: <20021202142720.GD1205@tykepenguin.com>
References: <20021202100202.16927.qmail@mail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20021202100202.16927.qmail@mail.com>
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
Date: Tue Dec  3 07:34:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Dec 02, 2002 at 05:02:02AM -0500, Nirmala S wrote:
> Hi,
> 
> Would lvm recognize pseudo devices files corresponding to the actual devices.
> 
> For example:
> pseudo1 ---> /dev/sda

LVM1 won't, LVM2 will.
 
> 
> Can I do a pvcreate on pseudo1 ?? 

You can, but vgcreate will fail (in LVM1).

patrick
