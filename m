From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] LE/PE Question
Message-ID: <658450000.1037989977@[192.168.200.4]>
In-Reply-To: <20021122103810.A12967@sistina.com>
References: <E18EFOt-0001Qf-00@hermes.sistina.com>
 <20021121115752.B8329@sistina.com> <448380000.1037896711@[192.168.200.4]>
 <20021122103810.A12967@sistina.com>
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
Date: Fri Nov 22 12:27:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


-- "Heinz J . Mauelshagen" <mauelshagen@sistina.com>

>> The unit of failure, for all pratical purposes, is the LV
>> (unless you are into using dd on raw disk devices to make
>> your backups). If one drive is likely to fail then any LV
>> crossing that LV is going to get fried (short of RAID) and
>> will have to be restored.
>
> With LVM2 (and deprecated LVM1.1) you are able to activate a VG even
> though some of its PVs are inaccessable.
> If any filesystem is mountable still depends on the availability
> of alternate superblocks and (at least) the root directory.

Which seems to mean that the unit of failure still is
the LV: if an LV spans PV's and the PV looses data then
the LV is unusable. The VG being able to survive an offline
PV is a Very Good Thing but doesn't do anything to help
someone with a filesystem on an LV with half its extents
missing.


--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 800 762 1582
