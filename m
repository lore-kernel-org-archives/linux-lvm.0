Return-Path: <be08d6c80b12c2c5f65ce33dc0983485@interlinx.bc.ca>
Date: Tue, 5 Jun 2001 21:07:27 -0700
Subject: Re: [linux-lvm] LILO configuration for LVM "boot" filesystem
Message-ID: <20010605210727.C1870@pc.ilinx>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010605104843.A9845@stocks.pillory.com>
From: "Brian J. Murrell" <lvm@interlinx.bc.ca>
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

On Tue, Jun 05, 2001 at 10:48:43AM -0500, Jack McKinney wrote:
> 
>     The only good reason to put root into an LV is that it is the cool
> way to do things.

Not only cool but sometimes necessary.  Sometimes root rides so close
to full that you cannot upgrade.  Then you start doing the "diskspace
shuffle" to get something you can upgrade.

Without wasting a ton of space when you initially install a system,
every system's root partition will hit the wall sooner or later.  That
is the unfortunate side effect of software evolution.

Anyway, I think we have exhausted the whys of doing it.  Now on to the
hows of doing it... I am still debugging.

b.

-- 
Brian J. Murrell
