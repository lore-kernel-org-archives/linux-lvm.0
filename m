From: "DJ TweeQ" <djtweeq@hotmail.com>
Subject: [linux-lvm] RE: Sharing LVM's via NFS on Redhat 8.0 (nice clarification)
Mime-Version: 1.0
Message-ID: <F42aXibm60wcP2dIuld0000538b@hotmail.com>
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
Date: Fri Feb 21 15:17:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Thanks Patrick...nice clarification and more than helpfull visual 
description :) Hey Sistina...wouldn't be such a bad idea to add that one to 
the sharing LV's/dangerous operations section on the HOWTO. :)

>Sharing over NFS is fine. What you are doing with NFS is sharing the 
> >filesystem.
>The dangerous behaviour mentioned is when you are sharing the actual >block
>device that is the LV. A subtle but very important distinction.

>This is safe:
>
>+----+   NFS   +---------+
>|    |---------|  Box B  |
>|boxA|         |         | +----+         +---------+                    | 
>SCSI/IDE/FC
>                    |
>		  ^^^^^^^
>		  |disks|
>		  |     |
>		  |     |
>		  |     |
>		  ^^^^^^^
>		  		  This is dangerous:
>
>+----+         +----+
>|    |         |    |
>|boxA|         |boxB| +----+         +----+      \       /       ^^^^^^^
>       |disks|
>       |     |
>       |     |
>       |     |
>       ^^^^^^^
>
>
>
>patrick
>









_________________________________________________________________
The new MSN 8: smart spam protection and 2 months FREE*  
http://join.msn.com/?page=features/junkmail
