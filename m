From: Malte Woelky <Malte.Woelky@gmx.de>
Message-ID: <9769820736.20040122170759@gmx.de>
Subject: Re[2]: [linux-lvm] recreate metadata of an PV possible if vda-backup present?
In-Reply-To: <20040122140727.GA992@tykepenguin.com>
References: <108049294.20040121235827@gmx.de>
 <20040122140727.GA992@tykepenguin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Thu Jan 22 11:09:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Patrick Caulfield <linux-lvm@sistina.com>

Hallo,

Thursday, January 22, 2004, 3:07:27 PM, you wrote:


>> 
>> I would be very, very happy if someone could post some hints to try...
>> 

PC> # pvcreate /dev/hdc
PC> # vgcfgrestore -n vg01 /dev/hdc
PC> # vgscan

PC> should restore the VG for you.

Thanks - I thought pvcreate would destroy the data, but it seem only
to initialize the PV without overwriting data, right?


It's pity that I can't check this out, because I already recreated a
new LV this morning because of time preasure ;-( Too bad for me...

-- 
Best regards,
 Malte                            mailto:malte.woelky@gmx.de

Malte Woelky -=[SkyNet]=- 
Unix/DBs/Networks/LDAP/Active Directory 
Cert  : MCSA 2000+2003, MCSA:msg, MCSE 2000+2003
voice : 0209/977 37 03 : 0174/95 32 105 
eMail : Malte.Woelky@gmx.de 
WWW : http://www.woelky.net/ 
_________ ICQ# 12 767 43 99 _________
