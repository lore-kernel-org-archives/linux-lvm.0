Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q9V04EoP008815
	for <linux-lvm@redhat.com>; Tue, 30 Oct 2012 20:04:15 -0400
Received: from awh1.active.ee (alfa.active.ee [194.204.30.36])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q9V04BhA002470
	for <linux-lvm@redhat.com>; Tue, 30 Oct 2012 20:04:12 -0400
From: Andres Toomsalu <andres@active.ee>
Date: Wed, 31 Oct 2012 02:04:08 +0200
Message-Id: <73698D91-B8D4-4F52-ABF3-54542ACB0690@active.ee>
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] strange usage stats for thin LV
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

I'm a bit puzzled with some thin LV usage stats - hope that someone can shed a light on this.
lvs shows that thin_backup LV is 94% used - but df  shows only 16% - where comes the difference?

lvs -a -o+metadata_percent
  LV                       VG         Attr     LSize   Pool Origin       Data%  Move Log Copy%  Convert Meta% 
  pool                     VolGroupL0 twi-a-tz   1,95t                    35,17                           2,79
  [pool_tdata]             VolGroupL0 Twi-aot-   1,95t                                                        
  [pool_tmeta]             VolGroupL0 ewi-aot-  14,00g                                                        
  root                     VolGroupL0 -wi-ao--  10,00g                                                        
  swap                     VolGroupL0 -wi-ao--  16,00g                                                        
  thin_backup              VolGroupL0 Vwi-aotz 600,00g pool               94,51                               
  thin_storage             VolGroupL0 Vwi-aotz 600,00g pool               20,98   


df -h
Filesystem            Size  Used Avail Use% Mounted on
/dev/mapper/VolGroupL0-root
                      9,9G  1,3G  8,1G  14% /
tmpfs                  16G     0   16G   0% /dev/shm
/dev/sda1            1008M  122M  835M  13% /boot
/dev/mapper/VolGroupL0-thin_storage
                      591G   39G  523G   7% /storage
/dev/mapper/VolGroupL0-thin_backup
                      591G   90G  472G  16% /backup

Thanks in advance,

-- 
----------------------------------------------
Andres Toomsalu
