Mime-Version: 1.0 (Apple Message framework v1084)
From: Brassow Jonathan <jbrassow@redhat.com>
In-Reply-To: <1342121728.93896.YahooMailNeo@web121605.mail.ne1.yahoo.com>
Date: Thu, 19 Jul 2012 11:33:13 -0500
Message-Id: <73EA4E19-9034-4128-9796-53368A0BA2AF@redhat.com>
References: <1342121728.93896.YahooMailNeo@web121605.mail.ne1.yahoo.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Switch between mirrored master/slave devices
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: DacioMF <daciomf@yahoo.com.br>, LVM general discussion and development <linux-lvm@redhat.com>

you could:
1) edit the LVM metadata.  It's not terribly hard and you would not have to wait for a mirror sync.
2) down-convert ('lvconvert -m -1 vg/lv /dev/mapper/mpath3) and upconvert (same as before but '-m +1').  This will require you to sync the whole mirror.

outside of the fact that mpath3 will be used as the standard to sync from after a machine failure, there is nothing else special about being the 'master'.  If you have a better reason than just aesthetics, you could do #1 or #2 above - otherwise, I don't see the harm in leaving it.

 brassow

On Jul 12, 2012, at 2:35 PM, DacioMF wrote:

> I have a logical volume mirrored between /dev/mapper/mpath0 and /dev/mapper/mpath3:
> # lvs -a -o +devices
>   LV                   VG       Attr     LSize   Pool Origin Data%  Move Log Copy%  Convert Devices                                   
>   vm01-disk            VMMIRROR mwi-aom-   7.00g                             100.00         vm01-disk_mimage_0(0),vm01-disk_mimage_1(0)
>   [vm01-disk_mimage_0] VMMIRROR iwi-aom-   7.00g                                            /dev/mapper/mpath3(0)                     
>   [vm01-disk_mimage_1] VMMIRROR iwi-aom-   7.00g                                            /dev/mapper/mpath0(0)
> 
> The master device (/dev/mapper/mpath0) failed and i repair it without any problem, but now my master device is /dev/mapper/mpath3.
> I want to change my master device back to /dev/mapper/mpath0 again. How can i do this?
>  
> DacioMF
> Analista de Redes e Infraestrutura
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
