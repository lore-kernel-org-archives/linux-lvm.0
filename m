From: lembark@wrkhors.com
Subject: Re: [linux-lvm] LVM System
Message-Id: <18610000.1015278554@duke.wrkhors.com>
In-Reply-To: <auto-000021223409@front2.mail.megapathdsl.net>
References: <auto-000021223409@front2.mail.megapathdsl.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Mon Mar  4 15:51:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com


-- "Anthony W. Marino" <anthony@AWMObjects.com> on 03/04/02 16:39:10 -0500

> Any thoughts or articles that would be usefull in determining the quality 
> on the following combination would be greatly appreciated:
> 
> LVM 1.x
> 3Ware 7800 Raid Controller
> Maxtor 40GB harddrives
> XFS Journalling FS
> SuSE 2.4.18+ Linux

Striped LVM on RAID5 is a nice, flexable way to go.
If you set the individual raid stripes at an I/O page
(normally 4K on linux) and then stripe across the
PV's the I/O gets spread nicely across plenty of paths.
Using a stripe == I/O size avoids the "write penalty" in 
RAID5, the Raid Controller and drives do a nice job of
buffering and the whole thing should work nicely.


--
Steven Lembark                              2930 W. Palmer
Workhorse Computing                      Chicago, IL 60647
                                           +1 800 762 1582
