From: Jose Luis Domingo Lopez <linux-lvm@24x7linux.com>
Subject: Re: [linux-lvm] encryption in LVM2
Message-ID: <20030217203406.GA6846@localhost>
References: <3E510115.C2FF3B83@silicide.dk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3E510115.C2FF3B83@silicide.dk>
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
Date: Mon Feb 17 14:34:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Monday, 17 February 2003, at 16:34:45 +0100,
Jon Bendtsen wrote:

> I only have experience with LVM1, but naturaly i've heard about LVM2,
> and the device mapper.
> Has anyone built in encryption into the device mapper ?
> Is anyone working on it ?
> 
I don't know of anyone working on block-based encryption for LVM2/DM,
but by now you can try one of the several filesystem-level encryption
solutions out there. I have personally used loop-aes, it is simple to
set up and works ok on my boxes.

Hope it helps.

-- 
Jose Luis Domingo Lopez
Linux Registered User #189436     Debian Linux Sid (Linux 2.4.20-xfsip)
