Return-Path: <jan@moria.gondor.com>
Date: Sat, 23 Dec 2000 00:09:04 +0100
From: Jan Niehusmann <list039@gondor.com>
Message-ID: <20001223000904.B2334@gondor.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] pv_read_all_pv_of_vg.c
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

I found the following lines in pv_read_all_pv_of_vg.c: (line 183ff)

      /* Check for contiguous PV array */
      for ( p = 0; pv_this[p] != NULL; p++)
         if ( pv_this[p] == NULL && p < np)
            ret = -LVM_EPV_READ_ALL_PV_OF_VG_NP_SORT;


the if condition can never be true, because of the condition in the for
statement. I don't think this does what it should do...

Jan
