Return-Path: <thornber@btconnect.com>
Date: Wed, 25 Jul 2001 19:30:40 +0100
Subject: Re: [linux-lvm] When Do I need to install the VFS patch?
Message-ID: <20010725193039.A756@btconnect.com>
References: <3B5F070C.7981D6DF@cup.hp.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3B5F070C.7981D6DF@cup.hp.com>; from defranco@cup.hp.com on Wed, Jul 25, 2001 at 10:51:08AM -0700
From: Joe Thornber <thornber@btconnect.com>
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
To: linux-lvm@sistina.com

On Wed, Jul 25, 2001 at 10:51:08AM -0700, John DeFranco wrote:
> Hi,
> 
> When do I need to apply the linux-2.4.X-VFS-lock.patch?
> Is it only required if I'm going to do snapshots and/or
> use reiserfs? I could not find any documentation that
> complete described this.

only if you're taking snapshots of reiserfs volumes.
