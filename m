Date: Wed, 8 Apr 2015 18:05:59 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20150408170559.GE32694@agk-dp.fab.redhat.com>
References: <1428468634.31919.250585153.41525C63@webmail.messagingengine.com>
	<5525331B.20604@redhat.com>
	<1428506200.875940.250771177.6EF89B58@webmail.messagingengine.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1428506200.875940.250771177.6EF89B58@webmail.messagingengine.com>
Subject: Re: [linux-lvm] unable to lvcreate _new_ LVs on existing VG
	with	existing LVs and plenty of room?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lyndat3@your-mail.com
Cc: xwhu@suse.com, LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Apr 08, 2015 at 08:16:40AM -0700, lyndat3@your-mail.com wrote:
> > >     lvm version
> > >             LVM version:     2.02.98(2) (2012-10-15)
> > >             Library version: 1.03.01 (2011-10-15)
> > >             Driver version:  4.29.0
> > This looks like you might have a mismatch of device-mapper and LVM.
> > Where did you get that device-mapper from? I am not aware of any 1.03.01 
> > version.
> I don't know where the "1.03" comes from.
> rpm -q device-mapper
>   device-mapper-1.02.78-20.2.2.x86_64
 
How odd!

> * Mon Oct 24 2011 xwhu@suse.com
>  - bnc#719424. Packages depend on libdevmapper want to differentiate
>    the libraries with udev support or without.
>    So, the package now provides both 1.02 and 1.03 libraries. The
>    1.02 library will be dropped once upstream bump up the version
>    number officially.

https://bugzilla.novell.com/show_bug.cgi?id=719424
"You are not authorized to access bug #719424. To see this bug, you must first log in to an account with the appropriate permissions."

I have no recollection of any upstream requirement to be able to
differentiate between libraries built with or without udev support
and we intention of bumping the version number for a reason such as this.

When we do bump it, it will be because of API changes that makes the
updated library incompatible with previously-compiled and supported
versions of lvm2.  (Obviously, we will now have to remember to skip the version
"1.03" because it's been used for something else!)

Alasdair
