From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200001011744.SAA26924@u9etz.ez-darmstadt.telekom.de>
Subject: [linux-lvm] Re: vgcreate 0.8-pre02.10.1999 segfault
In-Reply-To: <Pine.LNX.3.96.991227224159.11416C-100000@thelma.ing.umu.se> from Niklas Edmundsson at "Dec 27, 1999 11:10:55 pm"
Date: Sat, 1 Jan 2000 18:44:41 +0100 (MET)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Niklas Edmundsson <nikke@ing.umu.se>
Cc: linux-lvm@msede.com


Hi Nikke and a happy new year.

Please try replacing the end of tools/lib/lvm_tab_vg_check_exist_all_vg.c
starting from line 94 by:

   if ( ret < 0 || size < 2) {
      if ( data != NULL) {
         free ( data);
         data = NULL;
      }
      if ( vg_name_ptr     != NULL)      free ( vg_name_ptr);
      else if ( vg_name_ptr_sav != NULL) free ( vg_name_ptr_sav);
   }

   return vg_name_ptr;
}

and retry.

Regards,
Heinz


> 
> Tools: LVM-0.8-pre02.10.1999
> Kernel: patch-2.2.13-LVM-0.8i.gz (running on 2.2.13).
> 
> Compiled as a module (I couldn't get it to compile directly into the
> kernel, some silly linker-error pertaining to lvm_init).
> 
> The machine had existing PV/VG/LV:s from the 0.7-version, but since it
> is a test-machine I decided to try 0.8 on it.
> 
> It detected the existing config and all was nice. Then i removed all
> existing LV/VG:s and tried to create a new VG, giving me:
> 
> # vgcreate -d disk_lv /dev/hda5
> vg_check_name -- CALLED
> vg_check_name -- vg_name: "disk_lv"
> lvm_check_chars -- CALLED
> lvm_check_chars -- LEAVING
> vg_check_name -- LEAVING with ret: 0
> lvm_get_iop_version -- CALLED
> lvm_get_iop_version -- AFTER ioctl ret: 0
> lvm_get_iop_version -- LEAVING with ret: 0
> lvm_tab_vg_check_exist -- CALLED with vg_name: "disk_lv"
> vg_check_name -- CALLED
> vg_check_name -- vg_name: "disk_lv"
> lvm_check_chars -- CALLED
> lvm_check_chars -- LEAVING
> vg_check_name -- LEAVING with ret: 0
> lvm_tab_read -- CALLED
> lvm_tab_read -- LEAVING with ret: 0  data: 804CC28  size: 1
> lvm_tab_vg_check_exist -- LEAVING with ret: 0
> lvm_tab_vg_check_exist_all_vg -- CALLED
> Segmentation fault (core dumped)
> 
> I then remade the PV (pvcreate forced me to change the ID of hda5 to
> 0x8e in the process). Results are the same...
> 
> Have I stumbled into some stupid bug that makes it impossible to
> create a vg if you don't have one or ... ??
> 
> 
> Please get in touch if you need more information than I have given
> here, I guess you'll be needing that if you can't reproduce it
> easily...
> 
> 

-- 

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement CS-TS                           T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@EZ-Darmstadt.Telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
