Return-Path: <wichert@cistron.nl>
Date: Fri, 20 Apr 2001 11:41:16 +0200
From: Wichert Akkerman <wichert@cistron.nl>
Subject: Re: [linux-lvm] Re: LVM and DRDB
Message-ID: <20010420114116.C13067@cistron.nl>
References: <20010420111022.C6133@cistron.nl> <20010420113437.A14226@colombina.comedia.it>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010420113437.A14226@colombina.comedia.it>; from bluca@comedia.it on Fri, Apr 20, 2001 at 11:34:37AM +0200
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com, linux-openlvm@nl.linux.org

Previously Luca Berra wrote:
> just curious, what is DRDB?

See linux-ha.org. DRDB is basically a RAID1 blockdevice via the
network.

> besides which kind of connection do you have beetween the two sites
> are you planning on doing syncronous updates (i suspect such, since
> you are planning to put lvm over it)

Connection can be as fast as it takes, I suspect in this case it
will be a ATM link used just for this.

Wichert.

-- 
   ________________________________________________________________
 / Generally uninteresting signature - ignore at your convenience  \
| wichert@cistron.nl                  http://www.liacs.nl/~wichert/ |
| 1024D/2FA3BC2D 576E 100B 518D 2F16 36B0  2805 3CB8 9250 2FA3 BC2D |
