From: Andre Bonhote <andre@bonhote.com>
Subject: Re: [linux-lvm] Extend root file system in RH 8.0
Message-ID: <20030114153738.GA401@coffee.noc.ch.colt.net>
References: <55939F05720D954E9602518B77F6127F88E07E@FTWMLVEM01.e2k.ad.ge.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <55939F05720D954E9602518B77F6127F88E07E@FTWMLVEM01.e2k.ad.ge.com>
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
Date: Tue Jan 14 09:38:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hi!

On Tue, Jan 14, 2003 at 09:31:39AM -0600, Ma, Thanh(IndSys, GE Interlogix) =
wrote:
> Red Hat manual says to extend a LV with ext3 on it, the filesystem and
> swap need to be unmounted. I am curious how the root file system can
> be extended ?

Boot the system with the first CD and enter the "linux rescue" mode.
That should do.

HTH

Andr=EF=BF=BD


--=20
Real programmers do "cp /dev/audio a.out" and whistle into the mike.
                                                (Randal L. Schwartz)
