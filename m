From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] lvm lowers transfer rate
Message-ID: <20020725090033.GG1139@tykepenguin.com>
References: <F153arcR4ZDgC81Tbdk00000012@hotmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F153arcR4ZDgC81Tbdk00000012@hotmail.com>
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
Date: Thu Jul 25 04:00:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Jul 24, 2002 at 09:16:36PM -0400, Innocent Azinyue Ndangoh wrote:
> 
> Hi there,
> 
> I have 4 fiber channel disks, on which I intend to build a logical volume 
> using lvm. Before creating the logical volume, I run an I/O test on the 
> disks, which revealed that the disks each would do 10MBytes/sec I/Os.
> 
> However, when I create a logical volume, spanning all 4 disks using RAID0, 
> I realize that the transfer rate now drops. Instead (10 * 4)MB/s, I get 
> something close to 30MB/s. Am I doing something wrong?!?

I have found that striping Fibre-Channel only gives a performance boost up to
3 disks. I'm not sure whether that's a restriction of the FC interface I'm using
(emulex) or the Linux driver but it's certainly consistent with what you're seeing.

patrick
