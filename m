Return-Path: <lembark@jeeves.wrkhors.com>
Date: Sun, 12 Aug 2001 11:39:52 -0500
From: Steven Lembark <lembark@jeeves.wrkhors.com>
Subject: Re: [linux-lvm] Writing forward compatible applications using /proc
Message-ID: <193560000.997634392@dizzy>
In-Reply-To: <20010812135402.A452@dardhal.mired.net>
References: <20010812135402.A452@dardhal.mired.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@sistina.com


-- Jos=E9 Luis Domingo L=F3pez <jdomingo@internautas.org>

> As far as I know, there are plans to remove much of the thingss that
> currently appear under /proc. It seems that only information about
> processes currently running will remain under /proc.
>
> Kernel parameters, system information, kernel variables and kernel
> tunables will probably disappear and will be replaced by some sort of
> user-space application that will allow query and modfication of kernel
> values and tunables. Something similar to Solaris' ndd, AFAIK.

Too bad.  Having a consistent interface for examining the values (vs
relying on a -- possibly out of date -- command line tool) is a nice
feature for system management.  Being able to 'cat blah' is uniform
across versions.  This is especially nice for checking scsi params,
etc, that effect LVM and friends.

Any ides why they the /proc information is being dropped?

--
Steven Lembark                                               2930 W. Palmer
Workhorse Computing                                       Chicago, IL 60647
                                                            +1 800 762 1582
