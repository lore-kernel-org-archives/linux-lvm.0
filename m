Date: Sun, 5 Jun 2005 21:55:56 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] LVM help needed: conflicting names
Message-ID: <20050605205556.GO15809@agk.surrey.redhat.com>
References: <Pine.LNX.4.44.0506051558560.14259-100000@algiers.clic.cs.columbia.edu>
	<1118002227.5764.3.camel@erdelyi>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1118002227.5764.3.camel@erdelyi>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: redhat-list@redhat.com

> > $ man vgrename
 
With two VGs with the same name, you may have to use a
temporary lvm.conf filter to "hide" one of them before 
renaming the other.

Alasdair
-- 
agk@redhat.com
