From: "Mark H. Wood" <mwood@IUPUI.Edu>
Subject: Re: [linux-lvm] Block-Level Backup
In-Reply-To: <1060247670.28307.37.camel@rocky>
Message-ID: <Pine.LNX.4.55.0308070823230.10043@mhw.ULib.IUPUI.Edu>
References: <1060247670.28307.37.camel@rocky>
MIME-Version: 1.0
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
Date: Thu Aug  7 08:28:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Thu, 7 Aug 2003, Rocky Lee wrote:
[snip]
> but it'll be great if there's a tool,
> that supoorts block-level increment backup....

"Incremental backup" usually means "just the stuff that changed since last
time."  Filesystems typically have a last-write date in the metadata for
each file.  Where will you find the last-write date for each block of a
block device?  Or what do you mean by "incremental backup" of a block
device?

What problem are you trying to solve?

- -- 
Mark H. Wood, Lead System Programmer   mwood@IUPUI.Edu
MS Windows *is* user-friendly, but only for certain values of "user".
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)
Comment: pgpenvelope 2.10.2 - http://pgpenvelope.sourceforge.net/

iD8DBQE/MlO2s/NR4JuTKG8RAptlAJsEqXT0BUeIlhlbPXn40RB8UNBGsQCgiJek
iWddJfaYyccPHEmpBnR5FPw=
=x5lK
-----END PGP SIGNATURE-----
