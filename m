Message-Id: <200110032244.TAA06029@inter.lojasrenner.com.br>
From: Andre Margis <andre@sam.com.br>
Date: Wed, 3 Oct 2001 19:40:00 -0300
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Patch for lvm-1.0.1-rc4 to work under linux-2.4.10-ac4 (Re-edition)
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
To: linux-lvm@sistina.com

Sorry, for last message i wrong the function alloc_kiovec, is to be 
alloc_kiovec_sz


I change two programs to run under linux.2.4.10-ac4


I don't if this is correct. I test on my machine I believe it's working


This is my corrections:

on lvm.c

line 457
     /* insert our gendisk at the corresponding major */
        /*
        if (gendisk_head != NULL) {
                gendisk_ptr = gendisk_head;
                while (gendisk_ptr->next != NULL &&
                       gendisk_ptr->major > lvm_gendisk.major) {
                        gendisk_ptr = gendisk_ptr->next;
                }
                lvm_gendisk.next = gendisk_ptr->next;
                gendisk_ptr->next = &lvm_gendisk;
        } else {
                gendisk_head = &lvm_gendisk;
                lvm_gendisk.next = NULL;
        }
        */

        add_gendisk(&lvm_gendisk);

line 515
        /*
        gendisk_ptr = gendisk_ptr_prev = gendisk_head;
        while (gendisk_ptr != NULL) {
                if (gendisk_ptr == &lvm_gendisk)
                        break;
                gendisk_ptr_prev = gendisk_ptr;
                gendisk_ptr = gendisk_ptr->next;
        }*/
        /* delete our gendisk from chain */
        /*
        if (gendisk_ptr == &lvm_gendisk)
                gendisk_ptr_prev->next = gendisk_ptr->next;*/

        del_gendisk(&lvm_gendisk);


on lvm-snap.c

add line 53
int kio_max_sectors = KIO_MAX_SECTORS;

change all functions alloc_kiovec(a,b) by 
alloc_kiovec_sz(a,b,&kio_max_sectors)
at lines 518 and 527.

change all functions  free_kiovec(a,b) by free_kiovec_sz(a,b,&kio_max_sectors)
at lines 543, 548, 573 and 580


My changes are correct?

Any help?



Thanks



Andre

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-------------------------------------------------------
