Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Mon, 12 Feb 2001 16:01:05 +0000
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] lv nodes in /dev ??
Message-ID: <20010212160105.I522@tykepenguin.com>
References: <20010212114109.14372.qmail@web10909.mail.yahoo.com> <20010212114306.8793.qmail@web10901.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010212114306.8793.qmail@web10901.mail.yahoo.com>; from penguin_master_2000@yahoo.com on Mon, Feb 12, 2001 at 03:43:06AM -0800
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

On Mon, Feb 12, 2001 at 03:43:06AM -0800, Mr. Penguin wrote:
> > Hi people
> > 
> > Just noticed that all my LVs have nodes not only in
> > /dev/vg00/ but also /dev !
> > 
> > So I have /dev/vg00/lvol1 and also /dev/lvol1 with
> > the
> > same major and minor numbers. I don't like to think
> > what will happen if I create a new VG called vg01
> > also
> > with an lvol1...
> > 
> > This seems to be occuring in beta3 and beta4. I'm
> > using 2.4.1 / reiserfs (root on LVM)

Argh! You're right!

patrick
