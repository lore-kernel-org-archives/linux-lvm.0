Message-Id: <200005112151.XAA00152@e35.marxmeier.com>
Subject: RE: [linux-lvm] 2.2.15 Kernel LVM 0.8 vgscan -- invalid i/o proto
Date: Thu, 11 May 2000 23:51:56 MESZ
In-Reply-To: <31A612FE6020D2119F6400A0C9B67EBB0381B0EF@FTHW901E>; from "Franken Klaus" at May 11, 100 6:01 pm
From: Michael Marxmeier <mike@msede.com>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Klaus.Franken@fth2.siemens.de
Cc: linux-lvm

> You don't need a newer kernel. The format changed between <= 0.8 and 0.8final.
> You have to re-create your physical volumes and to re-compile the new lvm-utils.

As far as i recall the physical format should be the same. Only the
format of the data exchanged between kernel and user mode was changed.

So using user-mode tools which are compatible with the LVM kernel
components should be sufficient - no re-creation of PVs or other
drastic options should be required.


Michael

--
Michael Marxmeier           Marxmeier Software AG
E-Mail: mike@msede.com      Besenbruchstrasse 9
Phone : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
