Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6SGbRa02159
	for <linux-lvm@redhat.com>; Wed, 28 Jul 2004 12:37:27 -0400
Received: from smtp105.mail.sc5.yahoo.com (smtp105.mail.sc5.yahoo.com
	[66.163.169.225])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i6SGbQe1017400
	for <linux-lvm@redhat.com>; Wed, 28 Jul 2004 12:37:27 -0400
Sender: frank@redhat.com
Message-ID: <4107D640.F972EC04@yahoo.de>
Date: Wed, 28 Jul 2004 18:37:20 +0200
From: Frank Mohr <f_mohr@yahoo.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvscan fails (some more debugging - cause found)
References: <4106E0D6.10D6AA3D@yahoo.de>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

I did some debugging and found where and why pvscan crashes.

Is the any tool to fix PE entries on disk?
There seem to be 7 corrupted entries.


I've added some debug messages to vg_read_with_pv_and_lv

there seems to be a mismatch between vg_this->lv[l]->lv_allocated_le and
some PE

i've change/added a check to the loop:


               debug ( "construct the lv_current_pe pointer array\n");
               /* construct the lv_current_pe pointer array */
               p = npe = 0;
               for ( p = 0; p < vg_this->pv_cur && npe <
vg_this->lv[l]->lv_allocated_le; p++)
               {
                   debug ( "p = %d - pe_total =
%d\n",p,vg_this->pv[p]->pe_total);
                  for ( ope = 0; ope < vg_this->pv[p]->pe_total; ope++)
                  {
                       debug ( "ope = %d\n",ope);
                     if ( vg_this->pv[p]->pe[ope].lv_num == lv_num)
                     {
                        pe_index = vg_this->pv[p]->pe[ope].le_num;
                       debug ( "pe_index = %d\n",pe_index);
                        if( pe_index > vg_this->lv[l]->lv_allocated_le)
                        {
                            debug("(fm) Error pe_index = %lu >
vg_this->lv[l]->lv_allocated_le = %lu\n",
                                pe_index ,
vg_this->lv[l]->lv_allocated_le);
                        }
                        else
                        {
                        vg_this->lv[l]->lv_current_pe[pe_index].dev =
vg_this->pv[p]->pv_dev;
                       debug ( "get_pe_offset = %d\n",ope);
                        vg_this->lv[l]->lv_current_pe[pe_index].pe =
get_pe_offset(ope, vg_this->pv[p]);
                       debug ( "get_pe_offset ->
%lu\n",vg_this->lv[l]->lv_current_pe[pe_index].pe);
                        vg_this->lv[l]->lv_current_pe[pe_index].reads =
\
                        vg_this->lv[l]->lv_current_pe[pe_index].writes =
0;
                        npe++;
                        }
                     }
                  }
               }
               debug ( "construct the lv_current_pe pointer array --
done\n");


the result is:

<1> p = 1 - pe_total = 19632
...
<1> ope = 17014
<1> pe_index = 28542
<1> get_pe_offset = 17014
<1> get_pe_offset -> 139387384
<1> ope = 17015
<1> pe_index = 32639
<1> (fm) Error pe_index = 32639 > vg_this->lv[l]->lv_allocated_le =
32500
<1> ope = 17016
<1> pe_index = 28544
<1> get_pe_offset = 17016
<1> get_pe_offset -> 139403768
<1> ope = 17017
<1> pe_index = 28545
<1> get_pe_offset = 17017
...
<1> ope = 17142
<1> pe_index = 28670
<1> get_pe_offset = 17142
<1> get_pe_offset -> 140435960
<1> ope = 17143
<1> pe_index = 32767
<1> (fm) Error pe_index = 32767 > vg_this->lv[l]->lv_allocated_le =
32500
<1> ope = 17144
<1> pe_index = 28672
<1> get_pe_offset = 17144
<1> get_pe_offset -> 140452344
<1> ope = 17145
<1> pe_index = 28673
...
<1> construct the lv_current_pe pointer array -- done
vgscan -- only found 32493 of 32500 LEs for LV /dev/DATAVG/DATALV (0)
<1> vg_read_with_pv_and_lv -- LEAVING with ret: -365
<1> lvm_error -- CALLED with: -365
<1> lvm_error -- LEAVING with: "vg_read_with_pv_and_lv(): allocated LE
of LV"
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get
data of volume group "DATAVG" from physical volume(s)
<1> vg_free -- CALLED
<1> vg_free -- LEAVING with ret: -99
<1> lvm_interrupt -- CALLED
<1> lvm_interrupt -- LEAVING
<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: 0
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
group

<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: -104
