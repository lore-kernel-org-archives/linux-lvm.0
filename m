Return-Path: <andy@redeye.com>
Subject: Re: [linux-lvm] the curious case of the semi-created Logical Volume
References: <m21ytase6y.fsf_-_@andy.off.redeye.com> <20010208093123.B529@tykepenguin.com> <m2lmrhecgj.fsf@andy.off.redeye.com> <20010208100648.C529@tykepenguin.com>
From: Andy Cowling <andy@redeye.com>
Date: 08 Feb 2001 10:45:34 +0000
In-Reply-To: Patrick Caulfield's message of "Thu, 8 Feb 2001 10:06:48 +0000"
Message-ID: <m24ry5e9m9.fsf@andy.off.redeye.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>>>>> "Patrick" == Patrick Caulfield <caulfield@sistina.com> writes:

    Patrick> Sorry, I meant lvdisplay -d (note no -D). Stupidity is
    Patrick> contagious :-)

Hmmm. Hope this means more to you than it does to me.

Let me know if the output of 'lvdisplay -d -D /dev/pv01/lv01' would
also be of use.

# lvdisplay -d /dev/pv01/lv01
lvm_get_iop_version -- CALLED
lvm_get_iop_version -- AFTER ioctl ret: 0
lvm_get_iop_version -- LEAVING with ret: 0
lv_check_name -- CALLED
lv_check_name -- lv_name: "/dev/pv01/lv01"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- CALLED
vg_check_name -- vg_name: "pv01"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
lv_check_name -- LEAVING with ret: 0
vg_name_of_lv -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: "/dev/pv01/lv01"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- CALLED
vg_check_name -- vg_name: "pv01"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
lv_check_name -- LEAVING with ret: 0
vg_check_name -- CALLED
vg_check_name -- vg_name: "pv01"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
vg_name_of_lv -- LEAVING
lvm_tab_lv_check_exist -- CALLED with "/dev/pv01/lv01"
lv_check_name -- CALLED
lv_check_name -- lv_name: "/dev/pv01/lv01"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- CALLED
vg_check_name -- vg_name: "pv01"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
lv_check_name -- LEAVING with ret: 0
vg_name_of_lv -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: "/dev/pv01/lv01"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- CALLED
vg_check_name -- vg_name: "pv01"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
lv_check_name -- LEAVING with ret: 0
vg_check_name -- CALLED
vg_check_name -- vg_name: "pv01"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
vg_name_of_lv -- LEAVING
lvm_tab_vg_read_with_pv_and_lv -- CALLED vg_name: pv01
vg_check_name -- CALLED
vg_check_name -- vg_name: "pv01"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
vg_cfgrestore -- CALLED
vg_check_name -- CALLED
vg_check_name -- vg_name: "pv01"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
vg_check_consistency -- CALLED
vg_check_name -- CALLED
vg_check_name -- vg_name: "pv01"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
vg_check_consistency -- LEAVING with return 0
pv_check_consistency -- CALLED
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/sdc3"
pv_check_name -- LEAVING with ret: 0
vg_check_name -- CALLED
vg_check_name -- vg_name: "pv01"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
pv_check_new -- CALLED
pv_check_new -- LEAVING with ret: 0
pv_check_consistency -- LEAVING with ret: 0
pv_check_consistency -- CALLED
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/sdb2"
pv_check_name -- LEAVING with ret: 0
vg_check_name -- CALLED
vg_check_name -- vg_name: "pv01"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
pv_check_new -- CALLED
pv_check_new -- LEAVING with ret: 0
pv_check_consistency -- LEAVING with ret: 0
pv_check_consistency -- CALLED
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/sdb1"
pv_check_name -- LEAVING with ret: 0
vg_check_name -- CALLED
vg_check_name -- vg_name: "pv01"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
pv_check_new -- CALLED
pv_check_new -- LEAVING with ret: 0
pv_check_consistency -- LEAVING with ret: 0
pv_check_consistency -- CALLED
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/sdd3"
pv_check_name -- LEAVING with ret: 0
vg_check_name -- CALLED
vg_check_name -- vg_name: "pv01"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
pv_check_new -- CALLED
pv_check_new -- LEAVING with ret: 0
pv_check_consistency -- LEAVING with ret: 0
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: "/dev/pv01/lv01"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- CALLED
vg_check_name -- vg_name: "pv01"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
lv_check_name -- LEAVING with ret: 0
vg_check_name -- CALLED
vg_check_name -- vg_name: "pv01"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
lv_check_consistency -- LEAVING with ret: 0
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: "/dev/pv01/lv01"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- CALLED
vg_check_name -- vg_name: "pv01"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
lv_check_name -- LEAVING with ret: 0
vg_check_name -- CALLED
vg_check_name -- vg_name: "pv01"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
lv_check_consistency -- LEAVING with ret: 0
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: ""
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
lv_check_consistency -- LEAVING with ret: -148
vg_check_consistency_with_pv_and_lv -- CALLED
vg_check_consistency -- CALLED
vg_check_name -- CALLED
vg_check_name -- vg_name: "pv01"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
vg_check_consistency -- LEAVING with return 0
pv_check_consistency_all_pv -- CALLED
vg_check_consistency -- CALLED
vg_check_name -- CALLED
vg_check_name -- vg_name: "pv01"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
vg_check_consistency -- LEAVING with return 0
pv_check_consistency -- CALLED
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/sdc3"
pv_check_name -- LEAVING with ret: 0
vg_check_name -- CALLED
vg_check_name -- vg_name: "pv01"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
pv_check_new -- CALLED
pv_check_new -- LEAVING with ret: 0
pv_check_consistency -- LEAVING with ret: 0
pv_check_consistency -- CALLED
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/sdb2"
pv_check_name -- LEAVING with ret: 0
vg_check_name -- CALLED
vg_check_name -- vg_name: "pv01"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
pv_check_new -- CALLED
pv_check_new -- LEAVING with ret: 0
pv_check_consistency -- LEAVING with ret: 0
pv_check_consistency -- CALLED
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/sdb1"
pv_check_name -- LEAVING with ret: 0
vg_check_name -- CALLED
vg_check_name -- vg_name: "pv01"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
pv_check_new -- CALLED
pv_check_new -- LEAVING with ret: 0
pv_check_consistency -- LEAVING with ret: 0
pv_check_consistency -- CALLED
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/sdd3"
pv_check_name -- LEAVING with ret: 0
vg_check_name -- CALLED
vg_check_name -- vg_name: "pv01"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
pv_check_new -- CALLED
pv_check_new -- LEAVING with ret: 0
pv_check_consistency -- LEAVING with ret: 0
pv_check_consistency_all_pv -- LEAVING with ret: 0
lv_check_consistency_all_lv -- CALLED vg->lv_max: 256
lv_check_consistency_all_lv -- vg->lv[0]: 804FC30  name: /dev/pv01/lv01
lv_check_consistency -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: "/dev/pv01/lv01"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- CALLED
vg_check_name -- vg_name: "pv01"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
lv_check_name -- LEAVING with ret: 0
vg_check_name -- CALLED
vg_check_name -- vg_name: "pv01"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
lv_check_consistency -- LEAVING with ret: 0
lv_check_consistency_all_lv -- vg->lv[1]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[2]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[3]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[4]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[5]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[6]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[7]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[8]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[9]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[10]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[11]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[12]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[13]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[14]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[15]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[16]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[17]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[18]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[19]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[20]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[21]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[22]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[23]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[24]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[25]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[26]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[27]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[28]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[29]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[30]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[31]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[32]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[33]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[34]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[35]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[36]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[37]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[38]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[39]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[40]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[41]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[42]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[43]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[44]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[45]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[46]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[47]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[48]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[49]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[50]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[51]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[52]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[53]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[54]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[55]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[56]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[57]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[58]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[59]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[60]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[61]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[62]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[63]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[64]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[65]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[66]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[67]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[68]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[69]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[70]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[71]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[72]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[73]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[74]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[75]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[76]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[77]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[78]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[79]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[80]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[81]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[82]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[83]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[84]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[85]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[86]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[87]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[88]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[89]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[90]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[91]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[92]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[93]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[94]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[95]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[96]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[97]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[98]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[99]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[100]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[101]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[102]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[103]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[104]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[105]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[106]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[107]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[108]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[109]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[110]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[111]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[112]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[113]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[114]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[115]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[116]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[117]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[118]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[119]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[120]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[121]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[122]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[123]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[124]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[125]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[126]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[127]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[128]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[129]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[130]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[131]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[132]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[133]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[134]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[135]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[136]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[137]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[138]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[139]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[140]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[141]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[142]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[143]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[144]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[145]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[146]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[147]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[148]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[149]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[150]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[151]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[152]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[153]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[154]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[155]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[156]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[157]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[158]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[159]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[160]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[161]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[162]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[163]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[164]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[165]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[166]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[167]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[168]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[169]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[170]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[171]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[172]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[173]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[174]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[175]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[176]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[177]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[178]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[179]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[180]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[181]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[182]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[183]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[184]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[185]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[186]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[187]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[188]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[189]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[190]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[191]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[192]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[193]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[194]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[195]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[196]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[197]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[198]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[199]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[200]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[201]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[202]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[203]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[204]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[205]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[206]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[207]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[208]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[209]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[210]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[211]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[212]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[213]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[214]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[215]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[216]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[217]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[218]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[219]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[220]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[221]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[222]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[223]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[224]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[225]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[226]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[227]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[228]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[229]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[230]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[231]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[232]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[233]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[234]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[235]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[236]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[237]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[238]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[239]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[240]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[241]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[242]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[243]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[244]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[245]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[246]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[247]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[248]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[249]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[250]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[251]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[252]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[253]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[254]: 0  name: (null)
lv_check_consistency_all_lv -- vg->lv[255]: 0  name: (null)
lv_check_consistency_all_lv -- LEAVING with ret: 0
vg_check_consistency_with_pv_and_lv -- LEAVING with return 0
vg_cfgrestore -- LEAVING with ret: 0
lvm_tab_vg_read_with_pv_and_lv -- LEAVING with ret: 0
lvm_tab_lv_check_exist -- LEAVING with ret: 1
lv_check_active -- CALLED
lv_check_name -- CALLED
lv_check_name -- lv_name: "/dev/pv01/lv01"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- CALLED
vg_check_name -- vg_name: "pv01"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
lv_check_name -- LEAVING with ret: 0
lv_status_byname-- CALLED
lv_status_byname_internal -- CALLED
vg_check_name -- CALLED
vg_check_name -- vg_name: "pv01"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
lv_check_name -- CALLED
lv_check_name -- lv_name: "/dev/pv01/lv01"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- CALLED
vg_check_name -- vg_name: "pv01"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
lv_check_name -- LEAVING with ret: 0
lv_status_byname_internal -- AFTER ioctl ret: -6
lv_status_byname_internal -- LEAVING with ret: -6
lv_status_byname-- LEAVING
lv_check_active -- LEAVING with ret: -6
lvdisplay -- logical volume "/dev/pv01/lv01" is not active; try -D
