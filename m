From: Marco Krohn <marco.krohn@gmx.de>
MIME-Version: 1.0
References: <636740000.1017419834@dizzy.wrkhors.com>
Subject: Re: [linux-lvm] VG lost, VG restorable without lvmconf? Need help!
Message-Id: <17104.1017494046@www45.gmx.net>
Content-Type: text/plain; charset="us-ascii"
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
Date: Sat Mar 30 07:13:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

Hi again,   
   
> > This is a problem. Hmmmm...Try recreating your vol group config    
> > by running "vgcreate" and "lvcreate" from command line.    
> > Do not use yast , as this will call "vgscan" again   
   
Yast is more or less a interface for the LVM tools, it is just for    
people (like me) who are too lazy too look up the correct parameters.   
   
> > Also try "vgcfgrestore" , but   assume it is broken too,    
   
As far as I understand vgcfgrestore, it is only useful if you have a   
lvmtab resp. lvmtab.d which I do not have :-(   
   
> Remember that LVM doesn't effect the data on your disk, just   
> the LVM headers. If you remember the approx. sizes of things   
> you may be able to bring the LV back on line long enough to   
> back it up, blow off LVM, re-create the thing from scratch,   
> run the VG backups and restore the original data.   
   
Thanks for the information I wasn't sure if LVM can kill my data   
(forever) if I exectute commands like vgcreate etc.    
Unfortunately this doesn't help me since somehow the VG is there   
and somehow it isn't:   
   
root@feynman:~ # vgcreate system2 /dev/hda6 /dev/hda7 /dev/hdb2   
/dev/hdb5 /dev/hdb6 /dev/hdb7          [13:47]   
vgcreate -- volume group directory or file already exists   
vgcreate -- please choose a different name   
   
Also reducing the number of PV does not help, probably since every   
PV contains still the information that it belongs to "system2". Also   
changing the VG name does not help...   
   
root@feynman:~ # vgcreate system /dev/hda6 /dev/hda7 /dev/hdb2   
/dev/hdb5 /dev/hdb6 /dev/hdb7           [13:47]   
vgcreate -- "/dev/hda6" is not a new physical volume   
vgcreate -- physical volume "/dev/hda6" already belongs to volume   
group "system2"   
   
On the other hand "system2" does not "exist"...  
  
root@feynman:~ # vgchange -a y system2                                      
                            
[13:47]   
vgchange -- volume group "system2" does not exist   
   
root@feynman:~ # lvcreate -L1000 -ntestlv system2                           
                            
[13:54]   
lvcreate -- can't create logical volume: volume group "system2"   
doesn't exist   
   
Mmh, seems I can't execute any standard operations on these PVs.  
Perhaps one of the authors of the program could be so kind and tell 
me if there is any chance to get my data (at least partially) back? 
 
Happy Easter, 
   Marco 
 

-- 
GMX - Die Kommunikationsplattform im Internet.
http://www.gmx.net
