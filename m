From: Bradley M Alexander <storm@tux.org>
Message-ID: <20030320214806.GE26040@defiant.sonsofthunder.yi.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Upgrade path
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
Date: Thu Mar 20 15:48:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,
    
Got a quick question. I just bought a 120GB hard drive for my system. I am
currently running lvm-1.0.6, but I am also considering upgrading to lvm2.

Right now, I have the following:

    hda  Maxtor 30GB
    hdb  LG DVD ROM

    hdc  Maxtor 30GB
    hdd  LG CD-RW

    hde  WD 30GB

The 30GB drive on hde (on the on-board Promise PDC20265 controller) locks the
system when I boot with the drive connected. Not sure if it is a bad drive or 
some idiosyncracy with the controller. Now I have been told that you take a
pretty severe performance hit on the controller with a drive and a CD on the
same chain. So what I am thinking i
s
    hda  Maxtor 30GB
    hdb  Maxtor 30GB

    hdc  WD 120GB
    hdd  WD 30GB

    hde  DVD ROM
    hdf  CD-RW

or

    hdg  CD-RW

What would be the best drive configuration and upgrade path to lvm2? I'm
particularly concerned about scattering the drives to the wind and "losing"
them to lvm or having a lot of bogus lvm data floating around that I can't 
get rid of.

Thoughts?
-- 
--Brad
============================================================================
Bradley M. Alexander                |
Debian Developer, Security Engineer |   storm [at] tux.org
Debian/GNU Linux Developer          |   storm [at] debian.org
============================================================================
Key fingerprints:
DSA 0x54434E65: 37F6 BCA6 621D 920C E02E  E3C8 73B2 C019 5443 4E65
RSA 0xC3BCBA91: 3F 0E 26 C1 90 14 AD 0A  C8 9C F0 93 75 A0 01 34
============================================================================
Never draw fire, it irritates everyone around you.
						--Murphy's Laws of Combat
