Return-Path: <harri@smilehouse.com>
Date: Mon, 23 Apr 2001 10:37:11 +0300 (EEST)
From: Harri Haataja <harri@smilehouse.com>
Subject: Re: [linux-lvm] LVM and DRDB
In-Reply-To: <20010420154246.R13067@cistron.nl>
Message-ID: <Pine.LNX.4.21.0104231033440.16663-100000@tolppa.kotisivupalvelu.fi>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: linux-openlvm@nl.linux.org

On Fri, 20 Apr 2001, Wichert Akkerman wrote:

> Previously Jes Sorensen wrote:
> > For a file system that size you might want to look at XFS instead.
> 
> How stable is XFS compared to ext3 and reiserfs? For this system
> minimum downtime is very important..

Well, it is SGI/IRIX technology so it should be hugely scalable and stable
itself. It is a bit new on the Linux port, though (like IBM JFS) but a lot
of people seem to be trusting it already.

I personally don't think Reiser/ext3 have a significant headstart
yet. Reiser does have the odd B(*? +?)-tree magic technology inside
=) they so lobby.

I remember seeing a feature comparsion somewhere. LJ perhaps?

-- 
md5 sum:	07394dd242eb331be403826f2df92bbf
