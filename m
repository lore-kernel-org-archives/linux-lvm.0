Return-Path: <jan@moria.gondor.com>
Date: Wed, 24 Jan 2001 12:02:03 +0100
From: Jan Niehusmann <list039@gondor.com>
Subject: Re: [linux-lvm] Fwd: 2.4.0 kernel doesn't see LVM
Message-ID: <20010124120203.A1524@gondor.com>
References: <20010124184810.R715@ist.flinders.edu.au> <3A6E92DA.1A0DC5C5@infologic.fr>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3A6E92DA.1A0DC5C5@infologic.fr>; from bs@infologic.fr on Wed, Jan 24, 2001 at 09:31:22AM +0100
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

On Wed, Jan 24, 2001 at 09:31:22AM +0100, Benoit SERRA wrote:
> I think there is some way to migrate without restoring data, check the
> list archive for this.

Of course there is, 0.9 understands 0.8's on-disk structure, only the interface
between kernel and userspace has changed.

But it's always a good idea to make a backup ;-)

Jan
