Return-Path: <michael_e_brown@dell.com>
Date: Wed, 25 Apr 2001 23:08:02 -0500 (CDT)
From: Michael E Brown <michael_e_brown@dell.com>
In-Reply-To: <200104241727.f3OHRLD03762@smtp7.us.dell.com>
Message-ID: <D22AB62C940AD511BD000090271F3FE84B39FA-100000@ausxmbt101.us.dell.com>
MIME-Version: 1.0
Subject: [linux-lvm] RE: Does LVM support alternate links?
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Doug Ledford and Ingo Molnar of Red Hat have worked to put a 'multipath'
raid personality into Red Hat 7.1.  If people are interested, I can
forward a quick config Howto to the list. It is pretty straightforward.

To see the code, install the Red Hat kernel SRPM and take a look at
all of the SOURCES/*multipath* files.

--
Michael Brown
Linux Systems Group
Dell Computer Corp


> --__--__--
>
> Message: 2
> From: "Christian, Chip" <chip.christian@storageapps.com>
> To: linux-lvm@sistina.com
> Subject: RE: [linux-lvm] Does LVM support alternate links?
> Date: Tue, 24 Apr 2001 11:14:58 -0400
> Reply-To: linux-lvm@sistina.com
>
> I haven't looked closely enough at what's in the stock kernel right now, but last week I noticed that the patched 2.4.2 in RedHat 7.1 contains a multipathing driver, using raid1.c as a starting point.
>
> -----Original Message-----
> From: Heinz J. Mauelshagen [mailto:Mauelshagen@sistina.com]
> Sent: Tuesday, April 24, 2001 10:00
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] Does LVM support alternate links?
>
>
> On Fri, Apr 20, 2001 at 07:00:10PM +0200, Jens Bruckmann wrote:
> > Hallo everybody,
> >
> > I would like to know if the LVM supports alternate-links to the same
> > physical device over two fiber-channel links, so if one link fails, LVM
> > automatically uses the second link as it does under its "original" HP-UX.
>
> No, as someone else already answered.
>
> There's work queued though to enhance LVM to support multi-pathing.
>
> A brief description of our ideas includes that a path to a device has
> properties related to it like for eg. bandwidth or reliability of that
> particular path.
> These properties will be fed into the automatic decision taking process
> in the LVM driver to which path (if there's multiple available) a switch-over
> is going to take place.
> There'l be CLI and config file support to configure pathes/properties,
> keep that state and allow the user to witch over to different pathes manually.
>
> Time line for this is summer.
>
>
> --__--__--
