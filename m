Message-ID: <002101c2f518$28c5d830$c70aa8c0@RD.proware.com.tw>
From: "Rocky Lee" <rocky_lee@proware.com.tw>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] make kernel with XFS patch fail..
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
Date: Fri Mar 28 04:52:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi.

There're some discussion about this situation last year, .
http://lists.sistina.com/pipermail/linux-lvm/2002-April/011196.html

I also try to patch lvm1.0.7-xfs-2.4.20.patch  and
XFS 2.4.20 patch,
it looks OK now..: )

Rocky Lee


The message from XFS maling list.
----------------------------------------------------------------------------
--

I going to be soon in the same situation as you and i found
something interesting in the lvm list archive:

http://lists.sistina.com/pipermail/linux-lvm/2002-April/011196.html

This is basicaly a lvm-lock patch with the change that you need:

s/DQUOT_DEV()/DQUOT_SYNC_DEV()/g


--
Marcel de Riedmatten
pgp key: CFE703CA http://ftp.dotforge.ch/pub/users/mdr/mdr.gpg.asc
Empreinte: 4687 F9CB D8E2 AC1A B806  F812 C048 0875 CFE7 03CA
